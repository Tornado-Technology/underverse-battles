// Arguments: bone, use_gravity_attack, custom_repeats (optional)

bone_instances = [];
platform_speed = 1 + _power * 0.1;

callback = function () {
	if (use_gravity_attack) {
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
	}
	else {
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	}
	
	create_moving_platforms(border_instance.x - border_instance.left - 40, border_instance.y + 2, 5, 5, 60, platform_speed);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_update_up);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = choose(dir.up, dir.down);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}
	
	destroy_battle_object_array(bone_instances);
	
	character_instance.change_sprite_hand_dir(side);
	
	var warning_scale = 5;
	draw_warning(side, warning_scale);
	
	var i = 0;
	var x_position = border_instance.x - border_instance.left;
	while (x_position < border_instance.x + border_instance.right) {
		if (side == dir.up) {
			bone_instances[i] = create_bone(x_position, border_instance.y - border_instance.up - 25, bone, 0, 1, 0, 180);
		}
		if (side == dir.down) {
			bone_instances[i] = create_bone(x_position, border_instance.y + border_instance.down + 25, bone, 0, 1, 0, 0);
		}
		x_position += 10;
		i++;
	}
	audio_play_sound_plugging(snd_warning);
}

update_up = function() {
	var i = 0;
	repeat(array_length(bone_instances)) {
		bone_instances[i] = scale_bone(bone_instances[i], 3, 0.2);
		++i;
	}
	instance_destroy(obj_warning);
	audio_play_sound_plugging(snd_spare_up);
}

update_down = function() {
	var i = 0;
	repeat(array_length(bone_instances)) {
		bone_instances[i] = scale_bone(bone_instances[i], 1, 0.2);
		++i;
	}
}

update_platforms = function() {
	create_next_moving_platform(border_instance.x - border_instance.left - 40, border_instance.y + 2, 5, 5, 60, platform_speed);
}

switch (_power) {
	case 0:
		period = 75;
		time_step = [30, 25];
		repeats = 5;
		break;
	case 1:
		period = 70;
		time_step = [30, 25];
		repeats = 6;
		break;
	case 2:
		period = 66;
		time_step = [25, 25];
		repeats = 7;
		break;
	case 3:
		period = 62;
		time_step = [20, 25];
		repeats = 8;
		break;
	case 4:
		period = 58;
		time_step = use_gravity_attack ? [18, 30] : [15, 30];
		repeats = 10;
		break;
}

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}
	
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(time_source_update_up);
}, [], repeats - 1);

time_source_update_platforms = time_source_create(time_source_game, 1 / platform_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);
	
time_source_update_up = time_source_create(time_source_game, time_step[0] / 60, time_source_units_seconds, function () {
	update_up();
	time_source_start(time_source_update_down);
});
	
time_source_update_down = time_source_create(time_source_game, time_step[1] / 60, time_source_units_seconds, function () {
	update_down();
});
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();
});