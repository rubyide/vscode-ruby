import { ExtensionContext } from 'vscode';
import { RubyDocumentFormattingEditProvider } from '../format/rubyFormat';

export function registerFormatter(ctx: ExtensionContext) {
	new RubyDocumentFormattingEditProvider().register(ctx);
}
