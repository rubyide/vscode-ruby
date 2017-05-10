
declare module 'ruby-method-locate' {
	namespace parse {}
	function parse(fileName: string): Promise<any>;
	export = parse;
}