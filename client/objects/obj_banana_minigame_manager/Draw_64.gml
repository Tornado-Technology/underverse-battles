draw_reset();
draw_set_font(font_determination);
draw_set_color(c_white);

draw_text(5, 5, translate_score + ": " + string(bscore));

if (is_desktop && !mobile_mode) { draw_text(270, 5, "[esc] - " + translate_back); }
if (is_mobile || mobile_mode) { button_exit.draw(270 + text_width_back, 10); }

draw_reset(); 