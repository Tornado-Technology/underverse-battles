/// @arg duration_in
/// @arg duration_hold
/// @arg duration_out
/// @arg color
/// @arg {Bool} use_draw_gui_end
function effect_fade(duration_in, duration_hold, duration_out, color, use_draw_gui_end = false, persistent = false, callback = function() {}) {
	var effect = instance_create_depth(0, 0, 0, obj_effect_fader);
	effect.fade = true;
	effect.on_end_fade = callback;
	effect.duration_in = duration_in;
	effect.duration_hold = duration_hold;
	effect.duration_out = duration_out;
	effect._color = color;
	effect.use_draw_gui_end = use_draw_gui_end;
	effect.persistent = persistent;
}