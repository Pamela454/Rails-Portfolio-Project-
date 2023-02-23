"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printHeredoc = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { group, lineSuffix, join } = prettier_1.default;
const printHeredoc = (path, opts, print) => {
    const node = path.getValue();
    // Print out each part of the heredoc to its own doc node.
    const parts = path.map((partPath) => {
        const part = partPath.getValue();
        if (part.type !== "tstring_content") {
            return print(partPath);
        }
        return join(utils_1.literallineWithoutBreakParent, part.value.split(/\r?\n/));
    }, "parts");
    // We use a literalline break because matching indentation is required
    // for the heredoc contents and ending. If the line suffix contains a
    // break-parent, all ancestral groups are broken, and heredocs automatically
    // break lines in groups they appear in. We prefer them to appear in-line if
    // possible, so we use a literalline without the break-parent.
    return group([
        path.call(print, "beging"),
        lineSuffix(group([utils_1.literallineWithoutBreakParent, ...parts, node.ending]))
    ]);
};
exports.printHeredoc = printHeredoc;
