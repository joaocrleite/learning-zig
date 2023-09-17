const std = @import("std");

const console = std.io.getStdOut().writer();

pub fn main() !void {
    var a: i32 = undefined;
    a = 50;

    const c: i32 = 60;

    // const b = a;
    // OUTPUT:
    // a i32 50
    // b i32 50

    // const b: i8 = a;
    // OUTPUT ERROR:
    // signed 8-bit int cannot represent all possible signed 32-bit values

    // const b: i8 = @intCast(a);
    // OUTPUT:
    // a i32 50
    // b i8 50

    // const b: i8 = @as(i8, a);
    // OUTPUT ERROR:
    // signed 8-bit int cannot represent all possible signed 32-bit values

    const b: i8 = @as(i8, @intCast(a));
    const d: i8 = c;

    try console
        .print("a {} {} \n", .{ @TypeOf(a), a });
    try console
        .print("b {} {} \n", .{ @TypeOf(b), b });
    try console
        .print("c {} {} \n", .{ @TypeOf(c), c });
    try console
        .print("d {} {} \n", .{ @TypeOf(d), d });
}

// zig run ./basics/variables.zig
// a i32 50
// b i8 50
// c i32 60
// d i8 60
