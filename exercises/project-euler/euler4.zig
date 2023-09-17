const std = @import("std");
const expect = std.testing.expect;
const bufPrint = std.fmt.bufPrint;
const mem = std.mem;
const console = std.io.getStdOut().writer();

// Largest Palindrome Product
// A palindromic number reads the sam both ways.
// The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
// Find the largest palindrome made from the product of two 3-digit numbers.

fn is_palindromic(num: usize) anyerror!bool {
    const str = blk: {
        var buf: [20]u8 = undefined;
        break :blk try bufPrint(&buf, "{d}", .{num});
    };

    var i: usize = 0;
    while (i < str.len / 2) : (i += 1) {
        if (str[i] != str[str.len - 1 - i]) {
            return false;
        }
    }
    return true;
}

test "Largest Palindrome Product of two 2-digits numbers" {
    var largest: usize = 1;

    var i: usize = 10;
    while (i <= 99) : (i += 1) {
        var y: usize = 10;
        while (y <= 99) : (y += 1) {
            var product = i * y;
            const check = try is_palindromic(product);
            if (check and product > largest) {
                largest = product;
            }
        }
    }

    try expect(largest == 9009);
}

test "Largest Palindrome Product of two 3-digits numbers" {
    var largest: usize = 1;

    var i: usize = 100;
    while (i <= 999) : (i += 1) {
        var y: usize = 100;
        while (y <= 999) : (y += 1) {
            var product = i * y;
            const check = try is_palindromic(product);
            if (check and product > largest) {
                largest = product;
            }
        }
    }

    try expect(largest == 906609);
}

// zig test ./exercises/project-euler/euler4.zig
