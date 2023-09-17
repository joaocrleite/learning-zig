const std = @import("std");

const console = std.io.getStdOut().writer();

pub fn main() !void {

    // Arrays are denoted by [N]T, where N is the number of elements in the array and T is the type of those elements (i.e., the array’s child type).
    // For array literals, N may be replaced by _ to infer the size of the array.
    // const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const a = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    // For loops are used to iterate over arrays
    for (a, 0..) |character, index| {
        try console.print("{d} = {c} ", .{ index, character });
    }
    try console.print("\n", .{});
}

// zig run ./basics/for_loop.zig
// 0 = w 1 = o 2 = r 3 = l 4 = d
