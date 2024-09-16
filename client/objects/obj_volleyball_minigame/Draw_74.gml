var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);

draw_text_outlined(gui_width - 80, 20, c_white, c_black, text_team_1);
draw_text_outlined(gui_width - 80, 40, c_white, c_black, score_team_1);

draw_text_outlined(gui_width - 80, gui_height - 40, c_white, c_black, text_team_2);
draw_text_outlined(gui_width - 80, gui_height - 60, c_white, c_black, score_team_2);

draw_reset();