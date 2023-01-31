/// @arg power
/// @arg time
function effect_shake(_power, _time) {
	if (!instance_exists(obj_camera)) return;
	obj_camera.shake_time = convert_seconds_to_steps(real(_time));
	obj_camera.shake_power = real(_power);
}