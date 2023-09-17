const std = @import("std");

const console = std.io.getStdOut().writer();

pub fn main() !void {

    // Arrays are denoted by [N]T, where N is the number of elements in the array and T is the type of those elements (i.e., the array’s child type).
    // For array literals, N may be replaced by _ to infer the size of the array.
    const hello = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const world = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    // For loops are used to iterate over arrays
    for (hello) |character| {
        try console.print("{c}", .{character});
    }
    try console.print("\n", .{});

    for (world, 0..) |character, index| {
        if (index == 3) {
            continue;
        }
        try console.print("{c}", .{character});
    }
    try console.print("\n", .{});

    for (hello, 0..) |character, index| {
        if (index == 4) {
            break;
        }
        try console.print("{c}", .{character});
    }
    try console.print("\n", .{});

    for (world, 0..) |character, index| {
        try console.print("{d}={c} ", .{ index, character });
    }
    try console.print("\n", .{});
}

// zig run ./basics/for_loop.zig
// hello
// word
// hell
// 0=w 1=o 2=r 3=l 4=d
