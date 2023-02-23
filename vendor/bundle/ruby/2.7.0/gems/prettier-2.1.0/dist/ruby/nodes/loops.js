"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printUntil = exports.printWhile = exports.printFor = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { align, breakParent, group, hardline, ifBreak, indent, join, softline } = prettier_1.default;
function isModifier(node) {
    return node.type === "while_mod" || node.type === "until_mod";
}
function printLoop(keyword) {
    return function printLoopWithOptions(path, { rubyModifier }, print) {
        const node = path.getValue();
        const predicateDoc = path.call(print, "pred");
        // If the only statement inside this while loop is a void statement, then we
        // can shorten to just displaying the predicate and then a semicolon.
        if (!isModifier(node) && (0, utils_1.isEmptyStmts)(node.stmts)) {
            return group([group([keyword, " ", predicateDoc]), hardline, "end"]);
        }
        const statementDoc = path.call(print, isModifier(node) ? "stmt" : "stmts");
        const inlineLoop = (0, utils_1.inlineEnsureParens)(path, [
            statementDoc,
            ` ${keyword} `,
            predicateDoc
        ]);
        // If we're in the modifier form and we're modifying a `begin`, then this is
        // a special case where we need to explicitly use the modifier form because
        // otherwise the semantic meaning changes. This looks like:
        //
        //     begin
        //       foo
        //     end while bar
        //
        // The above is effectively a `do...while` loop (which we don't have in
        // ruby).
        if (isModifier(node) && node.stmt.type === "begin") {
            return inlineLoop;
        }
        const blockLoop = [
            [`${keyword} `, align(keyword.length + 1, predicateDoc)],
            indent([softline, statementDoc]),
            softline,
            "end"
        ];
        // If we're disallowing inline loops or if the predicate of the loop
        // contains an assignment (in which case we can't know for certain that that
        // assignment doesn't impact the statements inside the loop) then we can't
        // use the modifier form and we must use the block form.
        if (!rubyModifier || (0, utils_1.containsAssignment)(node.pred)) {
            return [breakParent, blockLoop];
        }
        return group(ifBreak(blockLoop, inlineLoop));
    };
}
const printFor = (path, opts, print) => {
    const node = path.getValue();
    let indexDoc = path.call(print, "index");
    if (node.index.type === "mlhs") {
        indexDoc = join(", ", indexDoc);
    }
    return group([
        "for ",
        indexDoc,
        " in ",
        path.call(print, "collection"),
        indent([hardline, path.call(print, "stmts")]),
        hardline,
        "end"
    ]);
};
exports.printFor = printFor;
exports.printWhile = printLoop("while");
exports.printUntil = printLoop("until");
