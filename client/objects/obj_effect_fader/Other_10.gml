/// @desc Fade
draw_reset();

var width  = target_gui ? display_get_gui_width() : room_width;
var height = target_gui ? display_get_gui_height() : room_height;

draw_set_alpha(_alpha);
draw_set_color(_color);
draw_rectangle(0, 0, width, height, false);

draw_reset();