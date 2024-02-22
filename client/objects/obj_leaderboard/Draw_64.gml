draw_reset();

var width = room_width;
var width_center = room_width / 2;
var width_third = room_width / 3;
var width_quarter = room_width / 4;
var list_offset = 15;

draw_set_font(global._font_main_determination);
draw_set_halign(fa_left);

var i = 0;
repeat(array_length(list)) {
	draw_text_outlined(width_quarter, 40 + i * list_offset, c_white, c_black, string(i) + ".");
	draw_text_outlined(width_third, 40 + i * list_offset, c_white, c_black, list[i][0]);
	draw_text_outlined(room_width - width_third, 40 + i * list_offset, c_white, c_black, string(list[i][1]));
	i++;
}
