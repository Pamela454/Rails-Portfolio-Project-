"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printRetry = exports.printRedo = exports.printRescueMod = exports.printRescueEx = exports.printRescue = exports.printEnsure = exports.printBegin = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const { align, group, hardline, indent, join, line } = prettier_1.default;
const printBegin = (path, opts, print) => {
    return [
        "begin",
        indent([hardline, path.call(print, "bodystmt")]),
        hardline,
        "end"
    ];
};
exports.printBegin = printBegin;
const printEnsure = (path, opts, print) => {
    return [
        path.call(print, "keyword"),
        indent([hardline, path.call(print, "stmts")])
    ];
};
exports.printEnsure = printEnsure;
const printRescue = (path, opts, print) => {
    const node = path.getValue();
    const parts = ["rescue"];
    if (node.extn) {
        parts.push(align("rescue ".length, path.call(print, "extn")));
    }
    else {
        // If you don't specify an error to rescue in a `begin/rescue` block, then
        // implicitly you're rescuing from `StandardError`. In this case, we're
        // just going to explicitly add it.
        parts.push(" StandardError");
    }
    const stmtsDoc = path.call(print, "stmts");
    if (stmtsDoc.length > 0) {
        parts.push(indent([hardline, stmtsDoc]));
    }
    // This is the next clause on the `begin` statement, either another
    // `rescue`, and `ensure`, or an `else` clause.
    if (node.cons) {
        parts.push([hardline, path.call(print, "cons")]);
    }
    return group(parts);
};
exports.printRescue = printRescue;
// This is a container node that we're adding into the AST that isn't present in
// Ripper solely so that we have a nice place to attach inline comments.
const printRescueEx = (path, opts, print) => {
    const node = path.getValue();
    const parts = [];
    if (node.extns) {
        // If there's just one exception being rescued, then it's just going to be a
        // single doc node.
        let exceptionDoc = path.call(print, "extns");
        // If there are multiple exceptions being rescued, then we're going to have
        // multiple doc nodes returned as an array that we need to join together.
        if (["mrhs", "mrhs_add_star", "mrhs_new_from_args"].includes(node.extns.type)) {
            exceptionDoc = group(join([",", line], exceptionDoc));
        }
        parts.push(" ", exceptionDoc);
    }
    if (node.var) {
        parts.push(" => ", path.call(print, "var"));
    }
    return group(parts);
};
exports.printRescueEx = printRescueEx;
const printRescueMod = (path, opts, print) => {
    return [
        "begin",
        indent([hardline, path.call(print, "stmt")]),
        hardline,
        "rescue StandardError",
        indent([hardline, path.call(print, "value")]),
        hardline,
        "end"
    ];
};
exports.printRescueMod = printRescueMod;
const printRedo = (path) => path.getValue().value;
exports.printRedo = printRedo;
const printRetry = (path) => path.getValue().value;
exports.printRetry = printRetry;
