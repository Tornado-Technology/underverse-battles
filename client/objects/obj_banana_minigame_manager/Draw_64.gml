draw_reset();

draw_set_font(global._font_main_determination);
draw_set_color(c_white);

draw_text(5, 5, translate_score + ": " + string(bscore));
draw_text(5, 20, trnaslate_highscore + ": " + string(highscore));

if (is_desktop) {
	draw_text(270, 5, "[esc] - " + translate_back);
}

if (is_mobile) {
	button_exit.draw(270 + text_width_back, 10);
}

draw_reset(); 
