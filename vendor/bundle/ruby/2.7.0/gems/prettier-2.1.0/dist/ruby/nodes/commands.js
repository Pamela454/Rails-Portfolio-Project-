"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printCommandCall = exports.printCommand = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { align, group, ifBreak, indent, join, line, softline } = prettier_1.default;
function throwBadDoc(doc) {
    throw new Error(`Unknown doc ${doc}`);
}
function reduceDocLength(sum, doc) {
    // If we've hit a line, then we're going to start the counting back at 0 since
    // it will be starting from the beginning of a line.
    if (typeof doc === "object" && !Array.isArray(doc) && doc.type === "line") {
        return 0;
    }
    return sum + docBreakLength(doc);
}
// Loop through the already created doc nodes and determine the overall length
// so that we can properly align the command arguments.
function docBreakLength(doc) {
    if (Array.isArray(doc)) {
        return doc.reduce(reduceDocLength, 0);
    }
    if (typeof doc === "string") {
        return doc.length;
    }
    switch (doc.type) {
        case "concat":
        case "fill":
            return doc.parts.reduce(reduceDocLength, 0);
        case "align":
        case "group":
        case "indent":
        case "line-suffix":
            return docBreakLength(doc.contents);
        case "if-break":
            return docBreakLength(doc.breakContents);
        case "line":
            return 0;
        case "break-parent":
        case "cursor":
        case "indent-if-break":
        case "label":
        case "line-suffix-boundary":
        case "trim":
            return 0;
        default:
            throwBadDoc(doc);
    }
}
function hasDef(node) {
    return (node.args.type === "args_add_block" &&
        node.args.args.type === "args" &&
        node.args.args.parts[0] &&
        ["def", "defs"].includes(node.args.args.parts[0].type));
}
// Very special handling case for rspec matchers. In general with rspec matchers
// you expect to see something like:
//
//     expect(foo).to receive(:bar).with(
//       'one',
//       'two',
//       'three',
//       'four',
//       'five'
//     )
//
// In this case the arguments are aligned to the left side as opposed to being
// aligned with the `receive` call.
function skipArgsAlign(node) {
    return ["to", "not_to", "to_not"].includes(node.message.value);
}
// If there is a ternary argument to a command and it's going to get broken
// into multiple lines, then we're going to have to use parentheses around the
// command in order to make sure operator precedence doesn't get messed up.
function hasTernaryArg(node) {
    var _a;
    switch (node.type) {
        case "args":
            return node.parts.some((child) => child.type === "ifop");
        case "args_add_block":
            return hasTernaryArg(node.args) || ((_a = node.block) === null || _a === void 0 ? void 0 : _a.type) === "ifop";
    }
}
const printCommand = (path, opts, print) => {
    const node = path.getValue();
    const command = path.call(print, "message");
    const joinedArgs = join([",", line], path.call(print, "args"));
    const hasTernary = hasTernaryArg(node.args);
    let breakArgs;
    if (hasTernary) {
        breakArgs = indent([softline, joinedArgs]);
    }
    else if (hasDef(node)) {
        breakArgs = joinedArgs;
    }
    else {
        breakArgs = align(docBreakLength(command) + 1, joinedArgs);
    }
    return group(ifBreak([
        command,
        hasTernary ? "(" : " ",
        breakArgs,
        hasTernary ? [softline, ")"] : ""
    ], [command, " ", joinedArgs]));
};
exports.printCommand = printCommand;
const printCommandCall = (path, opts, print) => {
    const node = path.getValue();
    const parts = [
        path.call(print, "receiver"),
        (0, utils_1.makeCall)(path, opts, print),
        path.call(print, "message")
    ];
    if (!node.args) {
        return parts;
    }
    const argDocs = join([",", line], path.call(print, "args"));
    let breakDoc;
    if (hasTernaryArg(node.args)) {
        breakDoc = parts.concat("(", indent([softline, argDocs]), softline, ")");
        parts.push(" ");
    }
    else if (skipArgsAlign(node)) {
        parts.push(" ");
        breakDoc = parts.concat(argDocs);
    }
    else {
        parts.push(" ");
        breakDoc = parts.concat(align(docBreakLength(parts), argDocs));
    }
    const joinedDoc = parts.concat(argDocs);
    return group(ifBreak(breakDoc, joinedDoc));
};
exports.printCommandCall = printCommandCall;
