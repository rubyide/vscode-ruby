import { of, merge, Observer, Observable, Subscription, Subject, AsyncSubject } from 'rxjs';
import { reduce } from 'rxjs/operators';
import { default as crossSpawn } from 'cross-spawn'; // eslint-disable-line import/no-named-default
import { SpawnOptions } from 'child_process';

export type SpawnOpts = {
	stdin?: Observable<string>;
	encoding?: string;
} & SpawnOptions;

export interface SpawnReturn {
	source: string;
	text: string;
}

/**
 * Spawns a process attached as a child of the current process.
 * Modified from the spawn-rx version
 *
 * @param  {string} exe               The executable to run
 * @param  {Array<string>} params     The parameters to pass to the child
 * @param  {Object} opts              Options to pass to spawn.
 *
 * @return {Observable<string>}       Returns an Observable that when subscribed
 *                                    to, will create a child process. The
 *                                    process output will be streamed to this
 *                                    Observable, and if unsubscribed from, the
 *                                    process will be terminated early. If the
 *                                    process terminates with a non-zero value,
 *                                    the Observable will terminate with onError.
 */
export function spawn<T = string>(
	cmd: string,
	args: string[] = [],
	opts: SpawnOpts = {}
): Observable<T> {
	return Observable.create((subj: Observer<SpawnReturn>) => {
		const { stdin, ...optsWithoutStdIn } = opts;
		// console.debug(`spawning process: ${cmd} ${args.join()}, ${JSON.stringify(optsWithoutStdIn)}`);

		const proc = crossSpawn(cmd, args, optsWithoutStdIn);

		const bufHandler = (source: string) => (b: string | Buffer): void => {
			if (b.length < 1) {
				return;
			}
			let chunk = '<< String sent back was too long >>';
			try {
				if (typeof b === 'string') {
					chunk = b.toString();
				} else {
					chunk = b.toString(optsWithoutStdIn.encoding || 'utf8');
				}
			} catch (e) {
				chunk = `<< Lost chunk of process output for ${cmd} - length was ${b.length}>>`;
			}

			subj.next({ source: source, text: chunk });
		};

		const ret = new Subscription();

		if (stdin) {
			if (proc.stdin) {
				ret.add(
					stdin.subscribe(
						(x: string): void => {
							proc.stdin.write(x);
						},
						subj.error.bind(subj),
						(): void => {
							proc.stdin.end();
						}
					)
				);
			} else {
				subj.error(
					new Error(
						`opts.stdio conflicts with provided spawn opts.stdin observable, 'pipe' is required`
					)
				);
			}
		}

		let stderrCompleted: Subject<boolean> | Observable<boolean> | null = null;
		let stdoutCompleted: Subject<boolean> | Observable<boolean> | null = null;
		let noClose = false;

		if (proc.stdout) {
			stdoutCompleted = new AsyncSubject<boolean>();
			proc.stdout.on('data', bufHandler('stdout'));
			proc.stdout.on('close', () => {
				(stdoutCompleted as Subject<boolean>).next(true);
				(stdoutCompleted as Subject<boolean>).complete();
			});
		} else {
			stdoutCompleted = of(true);
		}

		if (proc.stderr) {
			stderrCompleted = new AsyncSubject<boolean>();
			proc.stderr.on('data', bufHandler('stderr'));
			proc.stderr.on('close', () => {
				(stderrCompleted as Subject<boolean>).next(true);
				(stderrCompleted as Subject<boolean>).complete();
			});
		} else {
			stderrCompleted = of(true);
		}

		if (proc.stdin) {
			proc.stdin.on('error', e => {
				subj.error(e);
			});
		}

		proc.on('error', (e: Error) => {
			noClose = true;
			subj.error(e);
		});

		proc.on('close', (code: number) => {
			noClose = true;
			const pipesClosed = merge(stdoutCompleted, stderrCompleted).pipe(reduce(acc => acc, true));

			if (code === 0) {
				pipesClosed.subscribe(() => subj.complete());
			} else {
				pipesClosed.subscribe(() => subj.error(new Error(`Failed with exit code: ${code}`)));
			}
		});

		ret.add(
			new Subscription((): void => {
				if (noClose) {
					return;
				}

				// console.debug(`Killing process: ${cmd} ${args.join()}`);
				proc.kill();
			})
		);

		return ret;
	});
}
