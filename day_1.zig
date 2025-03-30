const std = @import("std");
const input = @embedFile("./inputs/day_1.txt");

pub fn main() !void {
    std.debug.print("{s}", .{input});
}
