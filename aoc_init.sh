# Create
base_file_name="day_"
day_num=$1
zig_extension=".zig"
txt_extension=".txt"

file_name="${base_file_name}${day_num}${zig_extension}"
file_name_p2="${base_file_name}${day_num}p2${zig_extension}"
input_file_name="${base_file_name}${day_num}${txt_extension}"
input_file_name="${base_file_name}${day_num}_test${txt_extension}"

touch "$file_name"
touch "$file_name_p2"
touch "./inputs/${input_file_name}"
touch "./inputs/${test_file_name}"

echo "const std = @import(\"std\");" >> "$file_name"
echo "const input = @embedFile(\"./inputs/${input_file_name}\");" >> "$file_name"
echo "\n" >> "$file_name"
echo "pub fn main() !void {" >> "$file_name"
echo "    std.debug.print(\"{s}\", .{input});" >> "$file_name"
echo "}" >> "$file_name"

echo "const std = @import(\"std\");" >> "$file_name_p2"
echo "const input = @embedFile(\"./inputs/${input_file_name}\");" >> "$file_name_p2"
echo "\n" >> "$file_name_p2"
echo "pub fn main() !void {" >> "$file_name_p2"
echo "    std.debug.print(\"{s}\", .{input});" >> "$file_name_p2"
echo "}" >> "$file_name_p2"
