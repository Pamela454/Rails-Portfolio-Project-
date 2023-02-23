"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const prettier_1 = __importDefault(require("../prettier"));
const location_1 = require("../ruby/location");
const { group, hardline, indent, join, line } = prettier_1.default;
function containedWithin(node) {
    return function containedWithinNode(comment) {
        return ((0, location_1.getStartChar)(comment.loc) >= (0, location_1.getStartChar)(node.loc) &&
            (0, location_1.getEndChar)(comment.loc) <= (0, location_1.getEndChar)(node.loc));
    };
}
// Empty collections are array or hash literals that do not contain any
// contents. They can, however, have comments inside the body. You can solve
// this by having a child node inside the array that gets the comments attached
// to it, but that requires modifying the parser. Instead, we can just manually
// print out the non-leading comments here.
function printEmptyCollection(path, opts, startToken, endToken) {
    const node = path.getValue();
    const containedWithinNode = containedWithin(node);
    // If there are no comments or only leading comments, then we can just print
    // out the start and end token and be done, as there are no comments inside
    // the body of this node.
    if (!node.comments || !node.comments.some(containedWithinNode)) {
        return `${startToken}${endToken}`;
    }
    const comments = [];
    const nodePath = path;
    // For each comment, go through its path and print it out manually.
    nodePath.each((commentPath) => {
        const comment = commentPath.getValue();
        if (containedWithinNode(comment)) {
            comment.printed = true;
            comments.push(opts.printer.printComment(commentPath, opts));
        }
    }, "comments");
    return group([
        startToken,
        indent([hardline, join(hardline, comments)]),
        line,
        endToken
    ]);
}
exports.default = printEmptyCollection;
