"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function isEmptyParams(node) {
    return (node.reqs.length === 0 &&
        node.opts.length === 0 &&
        !node.rest &&
        node.posts.length === 0 &&
        node.keywords.length === 0 &&
        !node.kwrest &&
        !node.block);
}
exports.default = isEmptyParams;
