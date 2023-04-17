/// @desc Collision
if (place_meeting(x, y, obj_battle_projectile)) {
	instance_place_list(x, y, obj_battle_projectile, list_projectiles, false);
	var list_size = ds_list_size(list_projectiles);
	var i = 0;
	repeat (list_size) {
		instance = list_projectiles[|i];
		instance.on_soul_touch(id);
		i++;
	}
	ds_list_clear(list_projectiles);
}