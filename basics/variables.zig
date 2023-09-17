const std = @import("std");

const console = std.io.getStdOut().writer();

pub fn main() !void {
    const const_number: i32 = 5; // signed 32-bit constant
    var var_number: u32 = 5000; // unsigned 32-bit variable

    try console
        .print("{}, {} \n", .{ const_number, var_number });
}

// zig run ./basics/variables.zig
// 5, 5000
