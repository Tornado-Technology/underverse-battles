shift = 0;
size = achievement_list_length;

alpha = 0.4;
buttons_show = true;
open_tab = true;
exit_tab = false;
next_tab = false;

// GUI
var width = display_get_gui_width();
var height = display_get_gui_height();
// ###

surface_cord = new Vector2(120, 50);
surface_size = new Vector2(width - 20, 180);
surface = surface_create(surface_size.x, surface_size.y);

scroll_up = function(coefficient = 1) {
	if (shift > -25) {
		shift -= 4 * coefficient;
	}
}

scroll_down = function(coefficient = 1) {
	if (shift < size * 60 - 200) {
		shift += 4 * coefficient;
	}
}