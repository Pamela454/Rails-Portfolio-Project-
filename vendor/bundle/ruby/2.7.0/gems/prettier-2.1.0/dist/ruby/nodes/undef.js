"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printUndef = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const { addTrailingComment, align, group, join, line } = prettier_1.default;
const printUndef = (path, opts, print) => {
    const symsDocs = path.map((symbolPath) => {
        const symbolNode = symbolPath.getValue();
        // If we're not printing a symbol literal then it's a dyna symbol, so
        // we're just going to print that node on its own.
        if (symbolNode.type !== "symbol_literal") {
            return print(symbolPath);
        }
        // We need to make sure we copy over any comments before we do the
        // printing so they get printed as well.
        if (symbolNode.comments) {
            symbolNode.comments.forEach((comment) => {
                addTrailingComment(symbolNode.value, comment);
            });
        }
        // If we're printing a symbol literal, then we want to descend into it and
        // just print the underlying contents so that it prints as a bare word.
        return symbolPath.call(print, "value");
    }, "syms");
    const keyword = "undef ";
    return group([keyword, align(keyword.length, join([",", line], symsDocs))]);
};
exports.printUndef = printUndef;
