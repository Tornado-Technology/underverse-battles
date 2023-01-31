/// @param {real} enemy_id
function fight_get_enemy_power(_enemy_id) {
	if (!instance_exists(obj_fight)) return 0;
	return obj_fight.enemy_power[clamp(_enemy_id, 0, 1)];
}