const std = @import("std");
const input = @embedFile("./inputs/day_1.txt");

pub fn main() !void {
    var iter = std.mem.splitSequence(u8, input, "\n");
    var index: u32 = 0;

    var left_list: [1000]i32 = undefined;
    var right_list: [1000]i32 = undefined;

    while (iter.next()) |line| {
        if (line.len == 0) continue;
        const line_tuple = try split_line(line);
        left_list[index] = line_tuple[0];
        right_list[index] = line_tuple[1];

        index += 1;
    }

    // Iterate through right list, adding frequencies to hash map
    // Iterate through left list, grabbing freq score for each num from hash map and summing them

    std.debug.print("Answer: {d}\n", .{1});
}

fn split_line(line: []const u8) ![2]i32 {
    var iter = std.mem.splitSequence(u8, line, "   ");
    const left = try std.fmt.parseInt(i32, iter.next().?, 10);
    const right = try std.fmt.parseInt(i32, iter.next().?, 10);
    return .{ left, right };
}

