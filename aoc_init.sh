# Create
base_file_name="day_"
day_num=$1
zig_extension=".zig"
txt_extension=".txt"

file_name="${base_file_name}${day_num}${zig_extension}"
input_file_name="${base_file_name}${day_num}${txt_extension}"

touch "$file_name"
touch "./inputs/${input_file_name}"

echo "const std = @import(\"std\");" >> "$file_name"
echo "const input = @embedFile(\"./inputs/${input_file_name}\");" >> "$file_name"
echo "pub fn main() !void {" >> "$file_name"
echo "    std.debug.print(\"{s}\", .{input});" >> "$file_name"
echo "}" >> "$file_name"
