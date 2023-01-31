/// @desc Collision
if (place_meeting(x, y, obj_battle_projectile)) {
	instance_place(x, y, obj_battle_projectile).on_soul_touch(id);
}
