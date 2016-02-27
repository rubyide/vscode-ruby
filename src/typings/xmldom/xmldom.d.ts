declare module 'xmldom' {
	export class DOMParser {
		parseFromString(xml: string, mimeType: string): XMLDocument;
	}
}