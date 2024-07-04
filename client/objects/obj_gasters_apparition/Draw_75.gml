if (!is_active) exit;

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

draw_sprite(spr_xgaster_apparition, 0, 10, gui_height);
draw_sprite(spr_gaster_apparition, 0, gui_width - 20, gui_height);