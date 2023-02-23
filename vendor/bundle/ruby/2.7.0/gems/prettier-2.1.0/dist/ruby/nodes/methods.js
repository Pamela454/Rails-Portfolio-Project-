"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printAccessControl = exports.printDefEndless = exports.printDef = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, hardline, indent, line } = prettier_1.default;
const printDef = (path, opts, print) => {
    const node = path.getValue();
    const declaration = ["def "];
    // In this case, we're printing a method that's defined as a singleton, so
    // we need to include the target and the operator before the name.
    if (node.type === "defs") {
        declaration.push(path.call(print, "target"), path.call(print, "op"));
    }
    // In case there are no parens but there are parameters
    const useParens = node.params.type === "params" && !(0, utils_1.isEmptyParams)(node.params);
    declaration.push(path.call(print, "name"), useParens ? "(" : "", path.call(print, "params"), useParens ? ")" : "");
    if ((0, utils_1.isEmptyBodyStmt)(node.bodystmt)) {
        return group([...declaration, "; end"]);
    }
    return group([
        group(declaration),
        indent([hardline, path.call(print, "bodystmt")]),
        hardline,
        "end"
    ]);
};
exports.printDef = printDef;
const printDefEndless = (path, opts, print) => {
    const node = path.getValue();
    let paramsDoc = "";
    // If we have any kind of parameters, we're going to print the whole
    // parentheses. If we don't, then we're just going to skip them entirely.
    if (node.paren && !(0, utils_1.isEmptyParams)(node.paren.cnts)) {
        paramsDoc = path.call(print, "paren");
    }
    return group([
        "def ",
        path.call(print, "name"),
        paramsDoc,
        " =",
        indent(group([line, path.call(print, "stmt")]))
    ]);
};
exports.printDefEndless = printDefEndless;
const printAccessControl = (path, opts, print) => path.call(print, "value");
exports.printAccessControl = printAccessControl;
