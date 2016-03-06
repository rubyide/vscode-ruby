declare module 'xmldom' {
	export class DOMParser {
		constructor(opts?: IDOMParserOpts);
		parseFromString(xml: string, mimeType: string): XMLDocument;
	}
	export function DOMErrorHandler(error:string): void;

	export interface IDOMErrorLocator {
		lineNumber: number;
		columnNumber: number;
	}
	export interface IDOMError {
		lineNumber: number;
		columnNumber: number;
		error: string;
		type: string;
	}
	export interface IDOMParserOpts {
		errorHandler?: Function;
		locator?: IDOMErrorLocator;
	}
}