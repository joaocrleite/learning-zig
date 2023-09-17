const std = @import("std");
const expect = std.testing.expect;
const console = std.io.getStdOut().writer();

// 10001st Prime
// By listing the first siz prime numbers: 2,3,5,7,11,13, we can see that the 6th prime is 13.
// What is the 10_001st prime number?

fn prime_position(position: usize) usize {
    var result: usize = 0;
    var num: usize = 2;
    var primes: usize = 0;
    while (primes < position) : (num += 1) {
        var is_prime: bool = true;
        var divisor: usize = 2;
        while (divisor < num) : (divisor += 1) {
            const remainder = num % divisor;
            if (remainder == 0) {
                is_prime = false;
            }
        }

        if (is_prime) {
            primes += 1;
            result = num;
        }
    }
    return result;
}

test "3rd prime" {
    const result = prime_position(3);

    try console.print("\n {d} \n", .{result});

    try expect(result == 5);
}

test "6th prime" {
    const result = prime_position(6);

    try console.print("\n {d} \n", .{result});

    try expect(result == 13);
}

test "10001st prime" {
    const result = prime_position(10_001);

    try console.print("\n {d} \n", .{result});

    try expect(result == 104_743);
}

// zig test ./exercises/project-euler/euler7.zig

// Test [1/3] test.3rd prime...
//  5
// Test [2/3] test.6th prime...
//  13
// Test [3/3] test.10001st prime...
//  104743
// All 3 tests passed.
