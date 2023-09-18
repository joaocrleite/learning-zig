const std = @import("std");
const expect = std.testing.expect;
const console = std.io.getStdOut().writer();
const math = std.math;

// Special Pythagorean Triplet
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a² + b² = c².
// for example, 3² + 4² = 9 + 16 = 25 = 5²
// There exists exactly one Pythagorean triplet for which a + b + c = 100.
// Find the product abc.

fn find_base_of_square(num: u32) u32 {
    const num_f = @as(f32, @floatFromInt(num));
    const num_q: u32 = math.sqrt(num);
    const num_q_f: f32 = math.pow(f32, num_f, 0.5);
    const num_q_to_f: f32 = @as(f32, @floatFromInt(num_q));
    return if (num_q_f == num_q_to_f) num_q else 0;
}

fn find_product_of_sum(sum: u32) anyerror!u32 {
    var product: u32 = 0;

    var a: u32 = 2;
    var b: u32 = 3;
    var c: u32 = 0;

    try console.print("\n", .{});
    while (a < sum) : (a += 1) {
        while (b < sum) : (b += 1) {
            var ar = math.pow(u32, a, 2);
            var br = math.pow(u32, b, 2);

            var cr: u32 = ar + br;
            c = find_base_of_square(cr);
            var temp_sum = a + b + c;
            var temp_product = a * b * c;

            if (c != 0 and temp_sum == sum) {
                try console.print("\n", .{});
                try console.print("a={d}, b={d}, c={d}\n", .{ a, b, c });
                try console.print("{d}² + {d}² = {d}² \n", .{ a, b, c });
                try console.print("{d} + {d} = {d} \n", .{ ar, br, cr });
                try console.print("{d} + {d} + {d} = {d} \n", .{ a, b, c, temp_sum });
                try console.print("{d} * {d} * {d} = {d} \n", .{ a, b, c, temp_product });
                try console.print("\n", .{});

                product = temp_product;
                break;
            }
        }
        b = a + 1;
        if (product != 0) {
            break;
        }
    }
    try console.print("\n", .{});
    return product;
}

test "Special Pythagorean Triplet" {
    const a: u32 = 3;
    const ar = math.pow(u32, a, 2);

    const b: u32 = 4;
    const br = math.pow(u32, b, 2);

    const cr: u32 = ar + br;
    const c: u32 = find_base_of_square(cr);

    const product = a + b + c;

    try expect(product == 12);
}

test "Special Pythagorean Triplet product of 12" {
    const result = try find_product_of_sum(12);
    try expect(result == 60);
}

test "Special Pythagorean Triplet of product of 1000" {
    const result = try find_product_of_sum(1000);
    try expect(result == 31_875_000);
}

// zig test ./exercises/project-euler/euler9.zig

// Test [2/3] test.Special Pythagorean Triplet product of 12...

// a=3, b=4, c=5
// 3² + 4² = 5²
// 9 + 16 = 25
// 3 + 4 + 5 = 12
// 3 * 4 * 5 = 60

// Test [3/3] test.Special Pythagorean Triplet of product of 1000...

// a=200, b=375, c=425
// 200² + 375² = 425²
// 40000 + 140625 = 180625
// 200 + 375 + 425 = 1000
// 200 * 375 * 425 = 31875000

// All 3 tests passed.
