"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.printUnlessModifier = exports.printUnless = exports.printIfModifier = exports.printIf = exports.printElsif = exports.printElse = exports.printTernary = void 0;
const prettier_1 = __importDefault(require("../../prettier"));
const utils_1 = require("../../utils");
const { align, breakParent, hardline, group, ifBreak, indent, softline } = prettier_1.default;
// If the statements are just a single if/unless, in block or modifier form, or
// a ternary
function containsSingleConditional(stmts) {
    return (stmts.body.length === 1 &&
        ["if", "if_mod", "ifop", "unless", "unless_mod"].includes(stmts.body[0].type));
}
function printWithAddition(keyword, path, print, breaking) {
    return [
        `${keyword} `,
        align(keyword.length + 1, path.call(print, "pred")),
        indent([softline, path.call(print, "stmts")]),
        [softline, path.call(print, "cons")],
        [softline, "end"],
        breaking ? breakParent : ""
    ];
}
// For the unary `not` operator, we need to explicitly add parentheses to it in
// order for it to be valid from within a ternary. Otherwise if the clause of
// the ternary isn't a unary `not`, we can just pass it along.
function printTernaryClause(clause) {
    if (Array.isArray(clause)) {
        const [part] = clause;
        if (Array.isArray(part) && part[0] === "not") {
            // We are inside of a statements list and the statement is a unary `not`.
            return ["not(", part[2], ")"];
        }
        if (clause[0] === "not") {
            // We are inside a ternary condition and the clause is a unary `not`.
            return ["not(", clause[2], ")"];
        }
    }
    return clause;
}
// The conditions for a ternary look like `foo : bar` where `foo` represents
// the truthy clause and `bar` represents the falsy clause. In the case that the
// parent node is an `unless`, these have to flip in order.
function printTernaryClauses(keyword, truthyClause, falsyClause) {
    const parts = [
        printTernaryClause(truthyClause),
        " : ",
        printTernaryClause(falsyClause)
    ];
    return keyword === "if" ? parts : parts.reverse();
}
// Handles ternary nodes. If it does not fit on one line, then we break out into
// an if/else statement. Otherwise we remain as a ternary.
const printTernary = (path, _opts, print) => {
    const predicateDoc = path.call(print, "pred");
    const truthyDoc = path.call(print, "tthy");
    const falsyDoc = path.call(print, "flsy");
    return group(ifBreak([
        "if ",
        align(3, predicateDoc),
        indent([softline, truthyDoc]),
        [softline, "else"],
        indent([softline, falsyDoc]),
        [softline, "end"]
    ], [predicateDoc, " ? ", ...printTernaryClauses("if", truthyDoc, falsyDoc)]));
};
exports.printTernary = printTernary;
function isModifier(node) {
    return node.type === "if_mod" || node.type === "unless_mod";
}
// Prints an `if_mod` or `unless_mod` node. Because it was previously in the
// modifier form, we're guaranteed to not have an additional node, so we can
// just work with the predicate and the body.
function printSingle(keyword) {
    return function printSingleWithKeyword(path, { rubyModifier }, print) {
        const node = path.getValue();
        const predicateDoc = path.call(print, "pred");
        const statementsDoc = path.call(print, isModifier(node) ? "stmt" : "stmts");
        const multilineParts = [
            `${keyword} `,
            align(keyword.length + 1, predicateDoc),
            indent([softline, statementsDoc]),
            softline,
            "end"
        ];
        // If we do not allow modifier form conditionals or there are comments
        // inside of the body of the conditional, then we must print in the
        // multiline form.
        if (!rubyModifier || (!isModifier(node) && node.stmts.body[0].comments)) {
            return [multilineParts, breakParent];
        }
        const inline = (0, utils_1.inlineEnsureParens)(path, [
            statementsDoc,
            ` ${keyword} `,
            predicateDoc
        ]);
        // With an expression with a conditional modifier (expression if true), the
        // conditional body is parsed before the predicate expression, meaning that
        // if the parser encountered a variable declaration, it would initialize
        // that variable first before evaluating the predicate expression. That
        // parse order means the difference between a NameError or not. #591
        // https://docs.ruby-lang.org/en/2.0.0/syntax/control_expressions_rdoc.html#label-Modifier+if+and+unless
        if (isModifier(node) && (0, utils_1.containsAssignment)(node.stmt)) {
            return inline;
        }
        return group(ifBreak(multilineParts, inline));
    };
}
const noTernary = [
    "alias",
    "assign",
    "break",
    "command",
    "command_call",
    "heredoc",
    "if",
    "if_mod",
    "ifop",
    "lambda",
    "massign",
    "next",
    "opassign",
    "rescue_mod",
    "return",
    "return0",
    "super",
    "undef",
    "unless",
    "unless_mod",
    "until_mod",
    "var_alias",
    "void_stmt",
    "while_mod",
    "yield",
    "yield0",
    "zsuper"
];
// Certain expressions cannot be reduced to a ternary without adding parens
// around them. In this case we say they cannot be ternaried and default instead
// to breaking them into multiple lines.
function canTernaryStmts(stmts) {
    if (stmts.body.length !== 1) {
        return false;
    }
    const stmt = stmts.body[0];
    // If the user is using one of the lower precedence "and" or "or" operators,
    // then we can't use a ternary expression as it would break the flow control.
    if (stmt.type === "binary" && ["and", "or"].includes(stmt.op)) {
        return false;
    }
    // Check against the blocklist of statement types that are not allowed to be
    // a part of a ternary expression.
    return !noTernary.includes(stmt.type);
}
// In order for an `if` or `unless` expression to be shortened to a ternary,
// there has to be one and only one "addition" (another clause attached) which
// is of the "else" type. Both the body of the main node and the body of the
// additional node must have only one statement, and that statement list must
// pass the `canTernaryStmts` check.
function canTernary(path) {
    const node = path.getValue();
    return (!["assign", "opassign", "command_call", "command"].includes(node.pred.type) &&
        node.cons &&
        node.cons.type === "else" &&
        canTernaryStmts(node.stmts) &&
        canTernaryStmts(node.cons.stmts));
}
// A normalized print function for both `if` and `unless` nodes.
function printConditional(keyword) {
    return function printConditionalWithKeyword(path, opts, print) {
        if (canTernary(path)) {
            let ternaryParts = [
                path.call(print, "pred"),
                " ? ",
                ...printTernaryClauses(keyword, path.call(print, "stmts"), path.call(print, "cons", "stmts"))
            ];
            if (["binary", "call"].includes(path.getParentNode().type)) {
                ternaryParts = ["(", ...ternaryParts, ")"];
            }
            return group(ifBreak(printWithAddition(keyword, path, print, false), ternaryParts));
        }
        const node = path.getValue();
        // If there's an additional clause that wasn't matched earlier, we know we
        // can't go for the inline option.
        if (node.cons) {
            return group(printWithAddition(keyword, path, print, true));
        }
        // If the body of the conditional is empty, then we explicitly have to use
        // the block form.
        if ((0, utils_1.isEmptyStmts)(node.stmts)) {
            return [
                `${keyword} `,
                align(keyword.length + 1, path.call(print, "pred")),
                hardline,
                "end"
            ];
        }
        // Two situations in which we need to use the block form:
        //
        // 1. If the predicate of the conditional contains an assignment, then we
        // can't know for sure that it doesn't impact the body of the conditional.
        //
        // 2. If the conditional contains just another conditional, then collapsing
        // it would result in double modifiers on the same line.
        if ((0, utils_1.containsAssignment)(node.pred) ||
            containsSingleConditional(node.stmts)) {
            return [
                `${keyword} `,
                align(keyword.length + 1, path.call(print, "pred")),
                indent([hardline, path.call(print, "stmts")]),
                hardline,
                "end"
            ];
        }
        return printSingle(keyword)(path, opts, print);
    };
}
const printElse = (path, opts, print) => {
    const node = path.getValue();
    return [
        node.stmts.body.length === 1 && node.stmts.body[0].type === "command"
            ? breakParent
            : "",
        "else",
        indent([softline, path.call(print, "stmts")])
    ];
};
exports.printElse = printElse;
const printElsif = (path, opts, print) => {
    const node = path.getValue();
    const parts = [
        group(["elsif ", align("elsif".length - 1, path.call(print, "pred"))]),
        indent([hardline, path.call(print, "stmts")])
    ];
    if (node.cons) {
        parts.push(group([hardline, path.call(print, "cons")]));
    }
    return group(parts);
};
exports.printElsif = printElsif;
exports.printIf = printConditional("if");
exports.printIfModifier = printSingle("if");
exports.printUnless = printConditional("unless");
exports.printUnlessModifier = printSingle("unless");
