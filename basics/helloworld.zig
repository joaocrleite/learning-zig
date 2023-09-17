const std = @import("std");

const console = std.io.getStdOut().writer();

pub fn main() !void {
    try console.print("Hello World! \n", .{});
}
