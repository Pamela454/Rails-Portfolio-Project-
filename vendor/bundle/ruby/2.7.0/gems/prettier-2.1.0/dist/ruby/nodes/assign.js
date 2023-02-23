"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printVarRef = exports.printVarField = exports.printOpAssign = exports.printAssign = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, indent, join, line } = prettier_1.default;
const printAssign = (...args) => {
    return printOpAssignOrAssign("=", ...args);
};
exports.printAssign = printAssign;
const printOpAssign = (path, opts, print) => {
    const opDoc = path.call(print, "op");
    return printOpAssignOrAssign(opDoc, path, opts, print);
};
exports.printOpAssign = printOpAssign;
function printOpAssignOrAssign(opDoc, path, opts, print) {
    const valueNode = path.getValue().value;
    const targetDoc = path.call(print, "target");
    const valueDoc = path.call(print, "value");
    let rightSideDoc = valueDoc;
    // If the right side of this assignment is a multiple assignment, then we need
    // to join it together with commas.
    if (["mrhs", "mrhs_add_star", "mrhs_new_from_args"].includes(valueNode.type)) {
        rightSideDoc = group(join([",", line], valueDoc));
    }
    if ((0, utils_1.skipAssignIndent)(valueNode)) {
        return group([targetDoc, " ", opDoc, " ", rightSideDoc]);
    }
    return group([targetDoc, " ", opDoc, indent([line, rightSideDoc])]);
}
const printVarField = (path, opts, print) => (path.getValue().value ? path.call(print, "value") : "");
exports.printVarField = printVarField;
const printVarRef = (path, opts, print) => path.call(print, "value");
exports.printVarRef = printVarRef;
