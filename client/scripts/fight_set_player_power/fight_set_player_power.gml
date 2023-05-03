/// @param {real} player_id
/// @param {real} value
function fight_set_player_power(_player_id, _value) {
	global.fight_instance.player_power[clamp(_player_id, 0, 1)] = abs(_value);
}