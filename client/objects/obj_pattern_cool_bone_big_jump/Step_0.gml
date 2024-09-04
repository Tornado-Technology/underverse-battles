if (instance_exists(bone_instances[0])) {
	big_jump_area_left = bone_instances[0].x - 3;	
}
if (instance_exists(big_bone_instance)) {
	big_jump_area_right = big_bone_instance.x + 3;
}

if (instance_exists(soul_instance)) {
	if (soul_instance.x >= big_jump_area_left && soul_instance.x <= big_jump_area_right) {
		soul_instance.max_fly_time = 1000;
		soul_instance.has_infinity_jump = true;
	}
	else {
		soul_instance.max_fly_time = 5;
		soul_instance.has_infinity_jump = false;
	}
}