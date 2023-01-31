/// @param {real} enemy_id
/// @param {real} value
function fight_remove_enemy_mana(_enemy_id, _value) {
	if (!instance_exists(obj_fight)) return;
	var mana = fight_get_enemy_mana(_enemy_id);
	var enemy = fight_set_enemy_mana(_enemy_id, max(0, mana - _value));
}