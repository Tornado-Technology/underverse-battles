draw_reset();

var width = room_width;
var width_third = room_width / 3;
var width_quarter = room_width / 4;
var list_top_position = 80;
var list_offset = 15;

draw_set_font(global._font_main_determination);
draw_set_halign(fa_left);

var i = 0;
repeat(array_length(list)) {
	var struct = set_rank(list[i][1]);
	draw_text_outlined(width_quarter, list_top_position + i * list_offset, struct.color, c_black, string(i + 1) + ".");
	draw_text_outlined(width_third, list_top_position + i * list_offset, struct.color, c_black, list[i][0]);
	draw_text_outlined(width - width_third, list_top_position + i * list_offset, struct.color, c_black, string(list[i][1]));
	i++;
}
