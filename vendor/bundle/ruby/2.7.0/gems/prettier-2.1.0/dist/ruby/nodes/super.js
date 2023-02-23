"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printZSuper = exports.printSuper = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const { align, group, join, line } = prettier_1.default;
const printSuper = (path, opts, print) => {
    const { args } = path.getValue();
    if (args.type === "arg_paren") {
        // In case there are explicitly no arguments but they are using parens,
        // we assume they are attempting to override a parent method and pass no
        // arguments up.
        return args.args === null ? "super()" : ["super", path.call(print, "args")];
    }
    const keyword = "super ";
    return group([
        keyword,
        align(keyword.length, group(join([",", line], path.call(print, "args"))))
    ]);
};
exports.printSuper = printSuper;
// Version of super without any parens or args.
const printZSuper = (path) => path.getValue().value;
exports.printZSuper = printZSuper;
