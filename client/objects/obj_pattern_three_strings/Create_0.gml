// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	var thread_instance = instance_create_depth(-1, border_instance.y - border_instance.up + 2, fight_depth.bullet_outside_hight, thread);
	thread_instance.x_dir = room_width + 1;
	thread_instance.y_dir = border_instance.y - border_instance.up + 2;
	thread_instance.scale_speed = 3.4;
	thread_instance = instance_create_depth(-1, border_instance.y, fight_depth.bullet_outside_hight, thread);
	thread_instance.x_dir = room_width + 1;
	thread_instance.y_dir = border_instance.y;
	thread_instance.scale_speed = 3.4;
	thread_instance = instance_create_depth(-1, border_instance.y + border_instance.down - 2, fight_depth.bullet_outside_hight, thread);
	thread_instance.x_dir = room_width + 1;
	thread_instance.y_dir = border_instance.y + border_instance.down - 2;
	thread_instance.scale_speed = 3.4;
	
	audio_play_sound_plugging(snd_string);
	
	time_source_start(time_source_delay);
}

var time_delay = 2;
time_source_delay = time_source_create(time_source_game, time_delay, time_source_units_seconds, function () {
	instance_create(obj_pattern_flying_bones, {
		border_instance: border_instance,
		_power: _power,
		bone: bone,
		sides: [dir.left, dir.right],
		is_aiming: true,
		final_function: destroy
	}).callback();
});

destroy = function () {
	instance_destroy(id);
}