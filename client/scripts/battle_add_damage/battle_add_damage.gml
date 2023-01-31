/// @param {real} damage
function battle_add_damage(_damage) {
	if (!instance_exists(obj_battle)) return;
	obj_battle.damage += _damage
}

/// @param {real} damage
function battle_remove_damage(_damage) {
	if (!instance_exists(obj_battle)) return;
	obj_battle.damage -= _damage
}