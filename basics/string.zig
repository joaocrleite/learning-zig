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

    // char ascii table 99 equals letter c
    const c: u8 = 'c';

    // char ascii table 100 equals letter d
    const d: u8 = 'd';

    const w: [4]u8 = [4]u8{ a, b, c, d };
    const wl = w.len;

    try console
        .print("const a type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(a), a, a });

    try console
        .print("const b type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(b), b, b });

    try console
        .print("const c type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(c), c, c });

    try console
        .print("const d type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(d), d, d });

    try console
        .print("const w type:{} len:{d} word:{s} \n", .{ @TypeOf(w), wl, w });
}

// zig run ./basics/string.zig
// const a type:u8 ascii:97 letter:a
// const b type:u8 ascii:65 letter:A
// const c type:u8 ascii:99 letter:c
// const d type:u8 ascii:100 letter:d
// const w type:[4]u8 len:4 word:aAcd
