const std = @import("std");
const expect = std.testing.expect;
const console = std.io.getStdOut().writer();

// Sum Square Difference
// The sum of the squares of the first ten natural numnbers is,
// 1² + 2² + ... + 10² = 385.
// The square of the sum of the first ten natural numbers is,
// (1 + 2 + ... + 10)² = 55² = 3025.
// Hence the difference between the sum of the squares of the first then natural numbers and the square of the sum is,
// 3025 - 385 = 2640.
// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

fn sum_squares(until: usize) usize {
    var result: usize = 0;
    var i: usize = 1;
    while (i <= until) : (i += 1) {
        result += i * i;
    }
    return result;
}

fn squares_sum(until: usize) usize {
    var result: usize = 0;
    var i: usize = 1;
    while (i <= until) : (i += 1) {
        result += i;
    }
    return result * result;
}

fn diff_squares(until: usize) usize {
    var a: usize = squares_sum(until);
    var b: usize = sum_squares(until);
    var result: usize = if (a > b) a - b else b - a;
    return result;
}

test "Sum squares until 10 is 385" {
    const result = sum_squares(10);

    try console.print("\n {d} \n", .{result});

    try expect(result == 385);
}

test "Squares sum until 10 is 3_025" {
    const result = squares_sum(10);

    try console.print("\n {d} \n", .{result});

    try expect(result == 3_025);
}

test "Diff between sum squares and squares sum until 10 is 2_640" {
    const result = diff_squares(10);

    try console.print("\n {d} \n", .{result});

    try expect(result == 2_640);
}

test "Sum squares until 100 is 338_350" {
    const result = sum_squares(100);

    try console.print("\n {d} \n", .{result});

    try expect(result == 338_350);
}

test "Squares sum until 100 is 25_502_500" {
    const result = squares_sum(100);

    try console.print("\n {d} \n", .{result});

    try expect(result == 25_502_500);
}

test "Diff between sum squares and squares sum until 100 is 25_164_150" {
    const result = diff_squares(100);

    try console.print("\n {d} \n", .{result});

    try expect(result == 25_164_150);
}

// zig test ./exercises/project-euler/euler6.zig

// Test [1/6] test.Sum squares until 10 is 385...
//  385
// Test [2/6] test.Squares sum until 10 is 3_025...
//  3025
// Test [3/6] test.Diff between sum squares and squares sum until 10 is 2_640...
//  2640
// Test [4/6] test.Sum squares until 100 is 338_350...
//  338350
// Test [5/6] test.Squares sum until 100 is 25_502_500...
//  25502500
// Test [6/6] test.Diff between sum squares and squares sum until 100 is 25_164_150...
//  25164150
// All 6 tests passed.
