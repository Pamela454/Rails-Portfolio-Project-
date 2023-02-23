"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printLambda = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, ifBreak, indent, line } = prettier_1.default;
// We can have our params coming in as the first child of the main lambda node,
// or if we have them wrapped in parens then they'll be one level deeper. Even
// though it's possible to omit the parens if you only have one argument, we're
// going to keep them in no matter what for consistency.
function printLambdaParams(path, print) {
    let node = path.getValue().params;
    // In this case we had something like -> (foo) { bar } which would mean that
    // we're looking at a paren node, so we'll descend one level deeper to get at
    // the actual params node.
    if (node.type !== "params") {
        node = node.cnts;
    }
    // If we don't have any params at all, then we're just going to bail out and
    // print nothing. This is to avoid printing an empty set of parentheses.
    if ((0, utils_1.isEmptyParams)(node)) {
        return "";
    }
    return path.call(print, "params");
}
// Lambda nodes represent stabby lambda literals, which can come in a couple of
// flavors. They can use either braces or do...end for their block, and their
// arguments can be not present, have no parentheses for a single argument, or
// have parentheses for multiple arguments. Below are a couple of examples:
//
//     -> { 1 }
//     -> a { a + 1 }
//     ->(a) { a + 1 }
//     ->(a, b) { a + b }
//     ->(a, b = 1) { a + b }
//
//     -> do
//       1
//     end
//
//     -> a do
//       a + 1
//     end
//
//     ->(a, b) do
//       a + b
//     end
//
// Generally, we're going to favor do...end for the multi-line form and braces
// for the single-line form. However, if we have an ancestor that is a command
// or command_call node, then we'll need to use braces either way because of
// operator precendence.
const printLambda = (path, opts, print) => {
    const params = printLambdaParams(path, print);
    const inCommand = (0, utils_1.hasAncestor)(path, ["command", "command_call"]);
    const stmtsDoc = path.call(print, "stmts");
    return group(ifBreak([
        "->",
        params,
        " ",
        inCommand ? "{" : "do",
        indent([line, stmtsDoc]),
        line,
        inCommand ? "}" : "end"
    ], ["->", params, " { ", stmtsDoc, " }"]));
};
exports.printLambda = printLambda;
