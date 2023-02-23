"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printTopConst = exports.printField = exports.printDefined = exports.printConstRef = exports.printConstPath = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, indent, softline } = prettier_1.default;
const printConstPath = (path, opts, print) => [path.call(print, "parent"), "::", path.call(print, "constant")];
exports.printConstPath = printConstPath;
const printConstRef = (path, opts, print) => path.call(print, "constant");
exports.printConstRef = printConstRef;
const printDefined = (path, opts, print) => {
    return group([
        "defined?(",
        indent([softline, path.call(print, "value")]),
        softline,
        ")"
    ]);
};
exports.printDefined = printDefined;
const printField = (path, opts, print) => {
    return group([
        path.call(print, "parent"),
        (0, utils_1.makeCall)(path, opts, print),
        path.call(print, "name")
    ]);
};
exports.printField = printField;
const printTopConst = (path, opts, print) => [
    "::",
    path.call(print, "constant")
];
exports.printTopConst = printTopConst;
