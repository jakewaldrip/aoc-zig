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

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var map = std.AutoHashMap(i32, i32).init(allocator);
    defer map.deinit();

    for (right_list) |right| {
        const right_key = try map.getOrPut(right);
        if (right_key.found_existing) {
            right_key.value_ptr.* += 1;
        } else {
            right_key.value_ptr.* = 1;
        }
    }

    var answer: i32 = 0;
    for (left_list) |left| {
        const maybe_value = map.get(left);
        if (maybe_value) |value| {
            answer += left * value;
        }
    }

    std.debug.print("Answer: {d}\n", .{answer});
}

fn split_line(line: []const u8) ![2]i32 {
    var iter = std.mem.splitSequence(u8, line, "   ");
    const left = try std.fmt.parseInt(i32, iter.next().?, 10);
    const right = try std.fmt.parseInt(i32, iter.next().?, 10);
    return .{ left, right };
}
