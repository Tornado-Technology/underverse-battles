draw_reset();

if (state == TIMER_STATE.STOP || state == TIMER_STATE.DISABLED)
	exit;
	
if (!show_timer) exit;

var gui_width = display_get_gui_width();

draw_reset();
draw_set_font(font_determination);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(gui_width / 2, 18, time);
draw_reset();