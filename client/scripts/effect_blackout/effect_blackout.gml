/// @arg color
/// @arg gui
/// @arg depth
function effect_blackout_start(color, gui, _depth) {
	var effect = instance_create_depth(0, 0, _depth, obj_effect_fader);
	effect._alpha = 1;
	effect.color_in = color;
	effect.color_out = color;
	effect.target_gui = gui;
	return true;
}

function effect_blackout_end() {
	instance_destroy(obj_effect_fader);
}