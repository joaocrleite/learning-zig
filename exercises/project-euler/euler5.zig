const std = @import("std");
const expect = std.testing.expect;
const console = std.io.getStdOut().writer();

// Smallest Multiple
// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

fn smallest_multiple(until: usize) usize {
    var num: usize = until * until;
    var founded = false;
    var result: usize = 0;

    while (!founded) : (num += 1) {
        var i: usize = 2;
        while (i <= until) : (i += 1) {
            const remainder = num % i;
            if (remainder != 0) {
                break;
            }

            if (i == until) {
                founded = true;
                result = num;
            }
        }
    }
    return result;
}

test "Smallest Multiple 1 .. 10" {
    const result = smallest_multiple(10);

    try console.print("\n {d} \n", .{result});

    try expect(result == 2520);
}

test "Smallest Multiple 1 .. 20" {
    const result = smallest_multiple(20);

    try console.print("\n {d} \n", .{result});

    try expect(result == 232792560);
}

// zig test ./exercises/project-euler/euler5.zig
