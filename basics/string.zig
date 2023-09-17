const std = @import("std");

const console = std.io.getStdOut().writer();

// https://www.asciitable.com/

pub fn main() !void {

    // char ascii table 97 equals letter a
    const a: u8 = 97;

    // char ascii table 65 equals letter A
    const b: u8 = 65;

    try console
        .print("const a type:{} letter:{c} \n", .{ @TypeOf(a), a });

    try console
        .print("const b type:{} letter:{c} \n", .{ @TypeOf(b), b });
}

// zig run ./basics/string.zig
// const a type:u8 letter:a
