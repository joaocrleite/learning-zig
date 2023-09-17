const std = @import("std");

const console = std.io.getStdOut().writer();

pub fn main() !void {
    const const_number: i32 = 50; // signed 32-bit constant
    const const_number_clone: i8 = const_number; // signed 8-bit constant, if the number can't fit 8-bit then an error will occurs

    try console
        .print("const_number {} {} \n", .{ @TypeOf(const_number), const_number });

    try console
        .print("const_number_clone {} {} \n", .{ @TypeOf(const_number_clone), const_number_clone });
}

// zig run ./basics/variables.zig
// const_number i32 50
// const_number_clone i8 50
