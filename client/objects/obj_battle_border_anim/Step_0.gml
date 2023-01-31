var anim_create = false;
if (global.fight_instance != noone) {
	anim_create = global.fight_instance.battle_continues;
}

if (animation_id == "Create" && anim_create) {
	progress = approach(progress, progress_max, progress_step);

	var amout = progress / progress_max;

	var up    = dir[dir.up]    * amout;
	var down  = dir[dir.down]  * amout;
	var left  = dir[dir.left]  * amout;
	var right = dir[dir.right] * amout;
	var angl  = angle * amout;

	battle_border_set_size(up, down, left, right);
	battle_border_set_angle(angl);

	if (progress == progress_max) instance_destroy();
}

if (animation_id == "Destroy") {
	progress = approach(progress, progress_max, progress_step);

	var amout = 1 - progress / progress_max;

	var up    = dir[dir.up]    * amout;
	var down  = dir[dir.down]  * amout;
	var left  = dir[dir.left]  * amout;
	var right = dir[dir.right] * amout;
	var angl  = angle * amout;

	battle_border_set_size(up, down, left, right);
	battle_border_set_angle(angl);

	if (progress == progress_max) { 
		instance_destroy(obj_battle_border); 
		instance_destroy();
	}
}