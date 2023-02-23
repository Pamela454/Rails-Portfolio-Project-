"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printSClass = exports.printModule = exports.printClass = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, hardline, indent } = prettier_1.default;
const printClass = (path, opts, print) => {
    const node = path.getValue();
    const parts = ["class ", path.call(print, "constant")];
    if (node.superclass) {
        parts.push(" < ", path.call(print, "superclass"));
    }
    const declaration = group(parts);
    if ((0, utils_1.isEmptyBodyStmt)(node.bodystmt)) {
        return group([declaration, hardline, "end"]);
    }
    return group([
        declaration,
        indent([hardline, path.call(print, "bodystmt")]),
        [hardline, "end"]
    ]);
};
exports.printClass = printClass;
const printModule = (path, opts, print) => {
    const node = path.getValue();
    const declaration = group(["module ", path.call(print, "constant")]);
    if ((0, utils_1.isEmptyBodyStmt)(node.bodystmt)) {
        return group([declaration, hardline, "end"]);
    }
    return group([
        declaration,
        indent([hardline, path.call(print, "bodystmt")]),
        hardline,
        "end"
    ]);
};
exports.printModule = printModule;
const printSClass = (path, opts, print) => {
    const node = path.getValue();
    const declaration = ["class << ", path.call(print, "target")];
    if ((0, utils_1.isEmptyBodyStmt)(node.bodystmt)) {
        return group([declaration, hardline, "end"]);
    }
    return group([
        declaration,
        indent([hardline, path.call(print, "bodystmt")]),
        hardline,
        "end"
    ]);
};
exports.printSClass = printSClass;
