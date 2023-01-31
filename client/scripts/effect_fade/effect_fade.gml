/// @arg duration_in
/// @arg duration_out
/// @arg color_in
/// @arg color_out
/// @arg gui
/// @arg depth
function effect_fade(duration_in, duration_out, color_in, color_out, gui, _depth, callback = function() {}) {
	var effect = instance_create_depth(0, 0, 0, obj_effect_fader);
	effect.fade = true;
	effect.on_end_fade = callback;
	effect.duration_in = duration_in;
	effect.duration_out = duration_out;
	effect.color_in = color_in;
	effect.color_out = color_out;
	effect.target_gui = gui;
	effect._depth = _depth;
}