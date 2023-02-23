"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printXStringLiteral = exports.printSymbolLiteral = exports.printStringLiteral = exports.printStringEmbExpr = exports.printStringDVar = exports.printStringConcat = exports.printDynaSymbol = exports.printChar = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const location_1 = require("../location");
const { group, hardline, indent, literalline, removeLines, softline, join } = prettier_1.default;
// If there is some part of this string that matches an escape sequence or that
// contains the interpolation pattern ("#{"), then we are locked into whichever
// quote the user chose. (If they chose single quotes, then double quoting
// would activate the escape sequence, and if they chose double quotes, then
// single quotes would deactivate it.)
function isQuoteLocked(node) {
    return node.parts.some((part) => part.type === "tstring_content" &&
        (part.value.includes("#{") || part.value.includes("\\")));
}
// A string is considered to be able to use single quotes if it contains only
// plain string content and that content does not contain a single quote.
function isSingleQuotable(node) {
    return node.parts.every((part) => part.type === "tstring_content" && !part.value.includes("'"));
}
const quotePattern = new RegExp("\\\\([\\s\\S])|(['\"])", "g");
function normalizeQuotes(content, enclosingQuote) {
    // Escape and unescape single and double quotes as needed to be able to
    // enclose `content` with `enclosingQuote`.
    return content.replace(quotePattern, (match, escaped, quote) => {
        if (quote === enclosingQuote) {
            return `\\${quote}`;
        }
        if (quote) {
            return quote;
        }
        return `\\${escaped}`;
    });
}
const quotePairs = {
    "(": ")",
    "[": "]",
    "{": "}",
    "<": ">"
};
function getClosingQuote(quote) {
    if (!quote.startsWith("%")) {
        return quote;
    }
    // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    const boundary = /%[Qq]?(.)/.exec(quote)[1];
    if (boundary in quotePairs) {
        return quotePairs[boundary];
    }
    return boundary;
}
// Prints a @CHAR node. @CHAR nodes are special character strings that usually
// are strings of length 1. If they're any longer than we'll try to apply the
// correct quotes.
const printChar = (path, opts) => {
    const { value } = path.getValue();
    if (value.length !== 2) {
        return value;
    }
    const quote = opts.rubySingleQuote ? "'" : '"';
    return [quote, value.slice(1), quote];
};
exports.printChar = printChar;
const printPercentSDynaSymbol = (path, opts, print) => {
    const node = path.getValue();
    const parts = [];
    // Push on the quote, which includes the opening character.
    parts.push(node.quote);
    path.each((childPath) => {
        const childNode = childPath.getValue();
        if (childNode.type !== "tstring_content") {
            // Here we are printing an embedded variable or expression.
            parts.push(print(childPath));
        }
        else {
            // Here we are printing plain string content.
            parts.push(join(literalline, childNode.value.split("\n")));
        }
    }, "parts");
    // Push on the closing character, which is the opposite of the third
    // character from the opening.
    parts.push(quotePairs[node.quote[2]]);
    return parts;
};
// We don't actually want to print %s symbols, as they're much more rarely seen
// in the wild. But we're going to be forced into it if it's a multi-line symbol
// or if the quoting would get super complicated.
function shouldPrintPercentSDynaSymbol(node) {
    // We shouldn't print a %s dyna symbol if it was not already that way in the
    // original source.
    if (node.quote[0] !== "%") {
        return false;
    }
    // Here we're going to check if there is a closing character, a new line, or a
    // quote in the content of the dyna symbol. If there is, then quoting could
    // get weird, so just bail out and stick to the original bounds in the source.
    const closing = quotePairs[node.quote[2]];
    return node.parts.some((child) => child.type === "tstring_content" &&
        (child.value.includes("\n") ||
            child.value.includes(closing) ||
            child.value.includes("'") ||
            child.value.includes('"')));
}
// Prints a dynamic symbol. Assumes there's a quote property attached to the
// node that will tell us which quote to use when printing. We're just going to
// use whatever quote was provided.
//
// In the case of a plain dyna symbol, node.quote will be either :" or :'
// For %s dyna symbols, node.quote will be %s[, %s(, %s{, or %s<
const printDynaSymbol = (path, opts, print) => {
    const node = path.getValue();
    if (shouldPrintPercentSDynaSymbol(node)) {
        return printPercentSDynaSymbol(path, opts, print);
    }
    const parts = [];
    let quote;
    if (isQuoteLocked(node)) {
        if (node.quote.startsWith("%")) {
            quote = opts.rubySingleQuote ? "'" : '"';
        }
        else if (node.quote.startsWith(":")) {
            quote = node.quote.slice(1);
        }
        else {
            quote = node.quote;
        }
    }
    else {
        quote = opts.rubySingleQuote && isSingleQuotable(node) ? "'" : '"';
    }
    parts.push(quote);
    path.each((childPath) => {
        const child = childPath.getValue();
        if (child.type !== "tstring_content") {
            parts.push(print(childPath));
        }
        else {
            parts.push(join(literalline, normalizeQuotes(child.value, quote).split("\n")));
        }
    }, "parts");
    parts.push(quote);
    // If we're inside of an assoc_new node as the key, then it will handle
    // printing the : on its own since it could change sides.
    const parentNode = path.getParentNode();
    if (parentNode.type !== "assoc" || parentNode.key !== node) {
        parts.unshift(":");
    }
    return parts;
};
exports.printDynaSymbol = printDynaSymbol;
const printStringConcat = (path, opts, print) => {
    return group([
        path.call(print, "left"),
        " \\",
        indent([hardline, path.call(print, "right")])
    ]);
};
exports.printStringConcat = printStringConcat;
// Prints out an interpolated variable in the string by converting it into an
// embedded expression.
const printStringDVar = (path, opts, print) => ["#{", path.call(print, "var"), "}"];
exports.printStringDVar = printStringDVar;
const printStringEmbExpr = (path, opts, print) => {
    const node = path.getValue();
    const doc = path.call(print, "stmts");
    // If the contents of this embedded expression were originally on the same
    // line in the source, then we're going to leave them in place and assume
    // that's the way the developer wanted this expression represented.
    if ((0, location_1.getStartLine)(node.loc) === (0, location_1.getEndLine)(node.loc)) {
        return ["#{", removeLines(doc), "}"];
    }
    return group(["#{", indent([softline, doc]), [softline, "}"]]);
};
exports.printStringEmbExpr = printStringEmbExpr;
// Prints out a literal string. This function does its best to respect the
// wishes of the user with regards to single versus double quotes, but if the
// string contains any escape expressions then it will just keep the original
// quotes.
const printStringLiteral = (path, { rubySingleQuote }, print) => {
    const node = path.getValue();
    // If the string is empty, it will not have any parts, so just print out the
    // quotes corresponding to the config
    if (node.parts.length === 0) {
        return rubySingleQuote ? "''" : '""';
    }
    // Determine the quote that should enclose the new string
    let quote;
    if (isQuoteLocked(node)) {
        quote = node.quote;
    }
    else {
        quote = rubySingleQuote && isSingleQuotable(node) ? "'" : '"';
    }
    const parts = path.map((partPath) => {
        const part = partPath.getValue();
        // In this case, the part of the string is an embedded expression
        if (part.type !== "tstring_content") {
            return print(partPath);
        }
        // In this case, the part of the string is just regular string content
        return join(literalline, normalizeQuotes(part.value, quote).split("\n"));
    }, "parts");
    return [quote, ...parts, getClosingQuote(quote)];
};
exports.printStringLiteral = printStringLiteral;
// Prints out a symbol literal. Its child will always be the ident that
// represents the string content of the symbol.
const printSymbolLiteral = (path, opts, print) => {
    return [":", path.call(print, "value")];
};
exports.printSymbolLiteral = printSymbolLiteral;
// Prints out an xstring literal. Its child is an array of string parts,
// including plain string content and interpolated content.
const printXStringLiteral = (path, opts, print) => {
    return ["`", ...path.map(print, "parts"), "`"];
};
exports.printXStringLiteral = printXStringLiteral;
