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

    // char ascii table 66 equals letter B
    const b: u8 = 66;

    // char ascii table 67 equals letter c
    const c: u8 = 'C';

    // char ascii table 100 equals letter d
    const d: u8 = 'd';

    // char ascii table 97 - 32 = 65(A)
    const a_up = a - 32;

    // char ascii table 67 + 32 = 99(c)
    const c_low = c + 32;

    const w: [4]u8 = [4]u8{ a, b, c, d };
    const wl = w.len;

    // undefined = 0
    // undefined array of 4 elements = [4]u8 = undefined = { undefined, undefined, undefined, undefined } = {0,0,0,0}
    // const w_up: [4]u8 = [4]u8{ 0, 0, 0, 0 };
    // const w_up: [4]u8 = [4]u8{ undefined, undefined, undefined, undefined };
    var w_up: [4]u8 = undefined;
    for (w, 0..) |w_letter, w_letter_index| {
        var ascii: u8 = w_letter;
        if (ascii >= 97 and ascii <= 122) {
            ascii -= 32;
        }
        w_up[w_letter_index] = ascii;
    }

    var w_low: [4]u8 = undefined;
    for (w, 0..) |w_letter, w_letter_index| {
        var ascii: u8 = w_letter;
        if (ascii >= 65 and ascii <= 90) {
            ascii += 32;
        }
        w_low[w_letter_index] = ascii;
    }

    try console
        .print("const a_up type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(a_up), a_up, a_up });

    try console
        .print("const b type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(b), b, b });

    try console
        .print("const c type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(c), c, c });

    try console
        .print("const c_low type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(c_low), c_low, c_low });

    try console
        .print("const d type:{} ascii:{d} letter:{c} \n", .{ @TypeOf(d), d, d });

    try console
        .print("const w type:{} len:{d} ascii:{d} word:{s} \n", .{ @TypeOf(w), wl, w, w });

    try console
        .print("const w_up type:{} len:{d} ascii:{d} word:{s} \n", .{ @TypeOf(w_up), w_up.len, w_up, w_up });

    try console
        .print("const w_low type:{} len:{d} ascii:{d} word:{s} \n", .{ @TypeOf(w_low), w_low.len, w_low, w_low });
}

// zig run ./basics/string.zig
// const a_up type:u8 ascii:65 letter:A
// const b type:u8 ascii:66 letter:B
// const c type:u8 ascii:67 letter:C
// const c_low type:u8 ascii:99 letter:c
// const d type:u8 ascii:100 letter:d
// const w type:[4]u8 len:4 ascii:{ 97, 66, 67, 100 } word:aBCd
// const w_up type:[4]u8 len:4 ascii:{ 65, 66, 67, 68 } word:ABCD
// const w_low type:[4]u8 len:4 ascii:{ 97, 98, 99, 100 } word:abcd
