/// @arg color
/// @arg {Real} alpha
/// @arg {Bool} use_draw_gui_end
/// @arg {Real} depth
function effect_fill(color, alpha = 1, use_draw_gui_end = false, depth = 0) {
	var effect = instance_create_depth(0, 0, depth, obj_effect_filler);
	effect._alpha = alpha;
	effect._color = color;
	effect.use_draw_gui_end =  use_draw_gui_end;
	return effect;
}