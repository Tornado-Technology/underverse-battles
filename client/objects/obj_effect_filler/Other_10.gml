/// @desc Fade
draw_reset();

var width  = display_get_gui_width();
var height = display_get_gui_height();

draw_set_alpha(_alpha);
draw_set_color(_color);
draw_rectangle(0, 0, width, height, false);

draw_reset();