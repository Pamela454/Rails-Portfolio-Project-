"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printNot = exports.printUnary = exports.printDot3 = exports.printDot2 = exports.printBinary = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, indent, line, softline } = prettier_1.default;
const printBinary = (path, opts, print) => {
    const node = path.getValue();
    const space = node.op === "**" ? "" : " ";
    if (utils_1.noIndent.includes(node.right.type)) {
        return group([
            group(path.call(print, "left")),
            space,
            node.op,
            space,
            group(path.call(print, "right"))
        ]);
    }
    return group([
        group(path.call(print, "left")),
        space,
        group(indent([
            node.op,
            space === "" ? softline : line,
            path.call(print, "right")
        ]))
    ]);
};
exports.printBinary = printBinary;
// dot2 nodes are used with ranges (or flip-flops). They can optionally drop
// their left side for beginless ranges or their right side for endless ranges.
const printDot2 = (path, opts, print) => {
    const node = path.getValue();
    return [
        node.left ? path.call(print, "left") : "",
        "..",
        node.right ? path.call(print, "right") : ""
    ];
};
exports.printDot2 = printDot2;
// dot3 nodes are used with ranges (or flip-flops). They can optionally drop
// their left side for beginless ranges or their right side for endless ranges.
const printDot3 = (path, opts, print) => {
    const node = path.getValue();
    return [
        node.left ? path.call(print, "left") : "",
        "...",
        node.right ? path.call(print, "right") : ""
    ];
};
exports.printDot3 = printDot3;
const printUnary = (path, opts, print) => {
    const node = path.getValue();
    return [node.op, path.call(print, "value")];
};
exports.printUnary = printUnary;
const printNot = (path, opts, print) => {
    const node = path.getValue();
    const valueDoc = path.call(print, "value");
    if (node.paren) {
        return ["not", "(", valueDoc, ")"];
    }
    return ["not", " ", valueDoc];
};
exports.printNot = printNot;
