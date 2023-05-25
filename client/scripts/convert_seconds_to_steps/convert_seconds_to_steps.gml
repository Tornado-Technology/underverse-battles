/// @description Important note: The functions calculate a value based on the set game speed, not the current `fps`
/// @param {Real} value
/// @return {Real}
function convert_seconds_to_steps(value) {
	return value * game_get_speed(gamespeed_fps);
}
