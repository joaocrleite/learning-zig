const expect = @import("std").testing.expect;

// Multiples of 3 or 5
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3,5,6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

fn find_sum_of_multiples(below: usize, multiples: []u8) usize {
    var sum: usize = 0;
    var i: usize = 1;
    while (i < below) : (i += 1) {
        var isMultiple: bool = false;

        for (multiples) |multiple| {
            if (i % multiple == 0) {
                isMultiple = true;
                break;
            }
        }

        if (isMultiple) {
            sum += i;
        }
    }
    return sum;
}

test "sum of multiples of 3 or 5 below 10" {
    const below: usize = 10;
    var multiples = [2]u8{ 3, 5 };
    const sum = find_sum_of_multiples(below, &multiples);
    try expect(sum == 23);
}

test "sum of multiples of 3 or 5 below 1000" {
    const below: usize = 1_000;
    var multiples = [2]u8{ 3, 5 };
    const sum = find_sum_of_multiples(below, &multiples);
    try expect(sum == 233_168);
}

// zig test ./exercises/project-euler/euler1.zig
