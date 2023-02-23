"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printMRHSNewFromArgs = exports.printMRHSAddStar = exports.printMRHS = exports.printMLHSParen = exports.printMLHS = exports.printMAssign = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const { group, indent, join, line, softline } = prettier_1.default;
const printMAssign = (path, opts, print) => {
    const node = path.getValue();
    let valueDoc = path.call(print, "value");
    if (["mrhs", "mrhs_add_star", "mrhs_new_from_args"].includes(node.value.type)) {
        valueDoc = group(join([",", line], valueDoc));
    }
    const targetDoc = [
        join([",", line], path.call(print, "target"))
    ];
    if (node.target.type === "mlhs" && node.target.comma) {
        targetDoc.push(",");
    }
    return group([group(targetDoc), " =", indent([line, valueDoc])]);
};
exports.printMAssign = printMAssign;
const printMLHS = (path, opts, print) => {
    return path.map(print, "parts");
};
exports.printMLHS = printMLHS;
const printMLHSParen = (path, opts, print) => {
    if (["massign", "mlhs_paren"].includes(path.getParentNode().type)) {
        // If we're nested in brackets as part of the left hand side of an
        // assignment, i.e., (a, b, c) = 1, 2, 3
        // ignore the current node and just go straight to the content
        return path.call(print, "cnts");
    }
    const node = path.getValue();
    const parts = [
        softline,
        join([",", line], path.call(print, "cnts"))
    ];
    if (node.cnts.comma) {
        parts.push(",");
    }
    return group(["(", indent(parts), [softline, ")"]]);
};
exports.printMLHSParen = printMLHSParen;
const printMRHS = (path, opts, print) => {
    return path.map(print, "parts");
};
exports.printMRHS = printMRHS;
const printMRHSAddStar = (path, opts, print) => {
    return [
        ...path.call(print, "mrhs"),
        ["*", path.call(print, "star")]
    ];
};
exports.printMRHSAddStar = printMRHSAddStar;
const printMRHSNewFromArgs = (path, opts, print) => {
    return path.call(print, "args");
};
exports.printMRHSNewFromArgs = printMRHSNewFromArgs;
