/// @description Important note: The functions calculate a value based on the set game speed, not the current `fps`.
/// Return: The number of seconds that will pass during the `step` event calls.
/// @param {Real} value
/// @return {Real}
function convert_steps_to_seconds(value) {
	return value / game_get_speed(gamespeed_fps);
}
