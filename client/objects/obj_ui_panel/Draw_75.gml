/// @desc Main UI
if (!active) return;

var width = display_get_gui_width();
var height = display_get_gui_height();

draw_reset();
draw_set_blend(c_black, blackout_alpha);
draw_rectangle(0, 0, width, height, false);
draw_reset();

var alpha = blackout_alpha / blackout_alpha_target;
draw_set_alpha(alpha);

for (var i = 0; i < array_length(buttons); i++) {
	var button = buttons[i];
	button.draw(width / 2, height / 3 + 30 * i, alpha);
}

draw_reset();
