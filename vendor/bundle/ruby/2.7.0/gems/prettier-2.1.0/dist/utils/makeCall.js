"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const makeCall = (path, opts, print) => {
    const node = path.getValue();
    const operator = node.op;
    // Ignoring the next block for coverage information because it's only relevant
    // in Ruby 2.5 and below.
    /* istanbul ignore next */
    if ([".", "&."].includes(operator)) {
        return operator;
    }
    return operator === "::" ? "." : path.call(print, "op");
};
exports.default = makeCall;
