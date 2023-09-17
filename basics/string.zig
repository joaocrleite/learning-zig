const std = @import("std");

const console = std.io.getStdOut().writer();

// https://www.asciitable.com/

pub fn main() !void {

    // ascii a..z = 97..122
    // ascii A..Z = 65..90
    // 97 - 65 = 32
    // so to upper case a letter just sub 32. to lower sum 32

    // char ascii table 97 equals letter a
    const a: u8 = 97;

    // char ascii table 65 equals letter A
    const b: u8 = 65;

    // char ascii table 67 equals letter c
    const c: u8 = 'C';

    // char ascii table 100 equals letter d
    const d: u8 = 'd';

    // char ascii table 97 - 32 = 65(A)
    const aUp = a - 32;

    // char ascii table 67 + 32 = 99(c)
    const cLow = c + 32;

    const w: [4]u8 = [4]u8{ a, b, c, d };
    const wl = w.len;

    try console
        .print("const a type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(a), a, a });

    try console
        .print("const aUp type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(aUp), aUp, aUp });

    try console
        .print("const b type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(b), b, b });

    try console
        .print("const c type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(c), c, c });

    try console
        .print("const cLow type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(cLow), cLow, cLow });

    try console
        .print("const d type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(d), d, d });

    try console
        .print("const w type:{} len:{d} word:{s} \n", .{ @TypeOf(w), wl, w });
}

// zig run ./basics/string.zig
// const a type:u8 ascii:97 letter:a
// const aUp type:u8 ascii:65 letter:A
// const b type:u8 ascii:65 letter:A
// const c type:u8 ascii:67 letter:C
// const cLow type:u8 ascii:99 letter:c
// const d type:u8 ascii:100 letter:d
// const w type:[4]u8 len:4 word:aACd
