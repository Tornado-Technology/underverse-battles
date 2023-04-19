/// @param {real} player_id
/// @param {real} value
function fight_set_player_power(_player_id, _value) {
	if (!instance_exists(obj_fight)) return;
	obj_fight.player_power[clamp(_player_id, 0, 1)] = abs(_value);
	
	//fight_update_state();
}