"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const skippable = [
    "array",
    "dyna_symbol",
    "hash",
    "heredoc",
    "lambda",
    "qsymbols",
    "qwords",
    "regexp_literal",
    "symbols",
    "words"
];
function skipAssignIndent(node) {
    return (skippable.includes(node.type) ||
        (node.type === "call" && skipAssignIndent(node.receiver)));
}
exports.default = skipAssignIndent;
