const expect = @import("std").testing.expect;

// Multiples of 3 or 5
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3,5,6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.

fn find_sum_of_multiples(below: usize) usize {
    var sum: usize = 0;
    var i: usize = 1;
    while (i < below) : (i += 1) {
        if (i % 3 == 0 or i % 5 == 0) {
            sum += i;
        }
    }
    return sum;
}

test "sum of multiples of 3 or 5 below 10" {
    const result = find_sum_of_multiples(10);
    try expect(result == 23);
}

test "sum of multiples of 3 or 5 below 1000" {
    const result = find_sum_of_multiples(1_000);
    try expect(result == 233_168);
}

// zig test ./exercises/project-euler/euler1.zig
