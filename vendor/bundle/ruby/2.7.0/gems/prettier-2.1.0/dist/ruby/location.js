"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getEndChar = exports.getEndLine = exports.getStartChar = exports.getStartLine = void 0;
function getStartLine(location) {
    return location[0];
}
exports.getStartLine = getStartLine;
function getStartChar(location) {
    return location[1];
}
exports.getStartChar = getStartChar;
function getEndLine(location) {
    return location[2];
}
exports.getEndLine = getEndLine;
function getEndChar(location) {
    return location[3];
}
exports.getEndChar = getEndChar;
