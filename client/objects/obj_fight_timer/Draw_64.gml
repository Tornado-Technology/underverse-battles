draw_reset();

if (!switch_on) exit;
if (time_source_get_state(source) == time_source_state_stopped) exit;

var gui_width = display_get_gui_width();

draw_reset();
draw_set_font(font_determination);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(gui_width / 2, 18, ceil(time_source_get_time_remaining(source)));
draw_reset();