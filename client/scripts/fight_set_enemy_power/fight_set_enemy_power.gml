/// @param {real} enemy_id
/// @param {real} value
function fight_set_enemy_power(_enemy_id, _value) {
	if (!instance_exists(obj_fight)) return;
	obj_fight.enemy_power[clamp(_enemy_id, 0, 1)] = abs(_value);
	
	//fight_update_state();
}