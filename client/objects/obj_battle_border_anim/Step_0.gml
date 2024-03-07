var anim_create = false;
if (global.fight_instance != noone) {
	anim_create = true;
}

if (animation_id == "Create" && anim_create) {
	progress = approach(progress, progress_max, progress_step * dtime);

	var amout = progress / progress_max;

	var up    = side[dir.up]    * amout;
	var down  = side[dir.down]  * amout;
	var left  = side[dir.left]  * amout;
	var right = side[dir.right] * amout;
	var angl  = angle * amout;

	battle_border_set_size(up, down, left, right);
	battle_border_set_angle(angl);

	if (progress == progress_max) instance_destroy();
}

if (animation_id == "Destroy") {
	progress = approach(progress, progress_max, progress_step * dtime);

	var amout = 1 - progress / progress_max;

	var up    = side[dir.up]    * amout;
	var down  = side[dir.down]  * amout;
	var left  = side[dir.left]  * amout;
	var right = side[dir.right] * amout;
	var angl  = angle * amout;

	battle_border_set_size(up, down, left, right);
	battle_border_set_angle(angl);

	if (progress == progress_max) { 
		instance_destroy(obj_battle_border); 
		instance_destroy();
	}
}