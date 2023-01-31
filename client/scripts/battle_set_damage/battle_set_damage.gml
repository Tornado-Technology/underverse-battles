/// @param {real} damage
function battle_set_damage(_damage) {
	if (!instance_exists(obj_battle)) return;
	obj_battle.damage = _damage
}