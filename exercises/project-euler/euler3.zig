const std = @import("std");
const expect = std.testing.expect;
const console = std.io.getStdOut().writer();

// Largest Prime Factor
// The prime factors of 13_195 are 5,7,13 and 29.
// What is the largest prime factor of the nummer 600_851_475_143

// https://www.calculatorsoup.com/calculators/math/prime-factors.php

fn largest_prime_factor(number: u64) u64 {
    var product: u64 = number;
    var largest_factor: u64 = 0;
    var current_factor: u64 = 1;

    while (product > 1) : (current_factor += 1) {
        const division_result = product % current_factor;

        if (division_result == 0) {
            product = product / current_factor;
            if (current_factor > largest_factor) {
                largest_factor = current_factor;
            }
            current_factor = 1;
        }
    }
    return largest_factor;
}

test "largest prime factor of the number 13_195" {
    const result = largest_prime_factor(13_195);
    try expect(result == 29);
}

test "largest prime factor of the number 600_851_475_143" {
    const result = largest_prime_factor(600_851_475_143);
    try expect(result == 6857);
}

// zig test ./exercises/project-euler/euler3.zig
