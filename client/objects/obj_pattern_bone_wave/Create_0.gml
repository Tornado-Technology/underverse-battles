// Arguments: bone

bone_size_shift = 0;
wave_time = fight_random_float(0, 2 * pi);

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update_destroy);
}

update = function() {
	var bone_speed = 3 + _power;
	var bone_size = _power < 4 ? 2.8 : 2.9;
	var bone_x = border_instance.x - border_instance.left - 5;
	
	repeat (25 + _power * 5) {
		var bone_instance_0 = create_bone(bone_x, border_instance.y + border_instance.down, bone, bone_speed, bone_size + bone_size_shift, 0, 0);
		var bone_instance_1 = create_bone(bone_x, border_instance.y - border_instance.up, bone, bone_speed, 6.7 - bone_size - bone_size_shift, 0, 180);
		bone_instance_0.is_destroying_outside = false;
		bone_instance_1.is_destroying_outside = false;
		bone_instance_0.set_accelerate(0.05);
		bone_instance_1.set_accelerate(0.05);
		bone_size_shift = sin(wave_time);
		wave_time += 0.8;
		
		bone_x -= 30 + _power * 10;
	}
}

time_source_update_destroy = time_source_create(time_source_game, 5 + _power, time_source_units_seconds, function() {
	instance_destroy();
});