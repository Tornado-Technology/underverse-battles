/// @arg duration_in
/// @arg duration_hold
/// @arg duration_out
/// @arg color
/// @arg gui
/// @arg depth
function effect_fade(duration_in, duration_hold, duration_out, color, gui, _depth, callback = function() {}) {
	var effect = instance_create_depth(0, 0, _depth, obj_effect_fader);
	effect.fade = true;
	effect.on_end_fade = callback;
	effect.duration_in = duration_in;
	effect.duration_hold = duration_hold;
	effect.duration_out = duration_out;
	effect._color = color;
	effect.target_gui = gui;
}