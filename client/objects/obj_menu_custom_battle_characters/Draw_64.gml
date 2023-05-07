event_inherited();

draw_set_font(global._font_main_determination);
draw_set_halign(fa_left);

if (selected_characters[0] == noone)
	draw_text_outlined(rec_x1 + dist_x, 5, c_white, c_black, text_your_char);
else
	draw_text_outlined(rec_x1 + dist_x, 5, c_white, c_black, text_enemy_char);