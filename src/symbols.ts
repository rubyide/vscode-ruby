import * as parse from 'ruby-method-locate';

interface Symbol {
    name: string,
    type: 'module' | 'class' | 'method' | 'classMethod',
    line: number,
    containerName: string
}

const DECLARATION_TYPES = ['class', 'module', 'method', 'classMethod'];

const concat = (x,y) => x.concat(y);
const flatMap = (xs,f) => xs.map(f).reduce(concat, []);

// this is adapted from the flatten function in locate.js, the differences are:
//  1. this produces a flat array of Symbols, rather than a nested object
//  2. this doesn't use lodash
function flatten(locateInfo: any, containerName?: string): Symbol[] {
    return flatMap(Object.keys(locateInfo), type => {
        const symbols = locateInfo[type];
        if (DECLARATION_TYPES.indexOf(type) === -1) {
            // Skip top-level include or posn property etc.
            return [];
        }
        return flatMap(Object.keys(symbols), name => {
            const inner = symbols[name];
            const symbolInfo = {
                name: name,
                type: type,
                line: inner.posn ? inner.posn.line : 0,
                containerName: containerName || ''
            };
            const sep = { method: '#', classMethod: '.' }[type] || '::';
            const fullName = containerName ? `${containerName}${sep}${name}` : name;

            return [symbolInfo].concat(flatten(inner, fullName));
        });
    });
}

export class SymbolLocator {
    private symbols: Promise<Symbol[]>;

    constructor(fileName: string) {
        this.symbols = parse(fileName).then(flatten);
    }

    symbolForLine(lineNumber: number): Promise<string> {
        return this.symbols.then(symbols => {
            let closestSymbol;
            for (const candidate of symbols) {
                if (lineNumber >= candidate.line && (!closestSymbol || candidate.line > closestSymbol.line)) {
                    closestSymbol = candidate;
                }
            }
            return this.formatSymbol(closestSymbol);
        });
    }

    formatSymbol(symbol?: Symbol): string {
        if (!symbol) {
            return "(Unknown symbol)";
        }

        const name = symbol.type === 'classMethod' ? `::${symbol.name}` : symbol.name;
        return symbol.containerName ? `${name} (${symbol.containerName})` : name;
    }
}
