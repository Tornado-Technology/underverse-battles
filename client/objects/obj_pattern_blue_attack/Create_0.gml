// Arguments: bone, use_gravity_attack, is_double, custom_repeats (optional)

bone_instances = [];
side = dir.left;
bone_count = 12;

callback = function () {
	if (use_gravity_attack)
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
	else
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	bone_scale = _power > 2 ? 2.8 : 3;
	if (!use_gravity_attack) bone_scale = 4.8;
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_up);
	time_source_start(time_source_update_destroy);
}

update = function() {
	side = choose(dir.up, dir.down, dir.left, dir.right);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}
	
	instance_destroy_array(bone_instances);
	
	character_instance.change_sprite_hand_dir(side);
	
	var warning_scale = 5;
	if (!use_gravity_attack) {
		warning_scale = 12;
	}
	
	var i = 0;
	var loop_count = 0;
	repeat (is_double ? 2 : 1) {
		repeat(bone_count) {
			if (side == dir.up) {
				bone_instances[i] = create_bone(border_instance.x - border_instance.left + (i - loop_count * bone_count) * 10, border_instance.y - border_instance.up - 25, bone, 0, 0, 0, 180);
			}
			if (side == dir.down) {
				bone_instances[i] = create_bone(border_instance.x - border_instance.left + (i - loop_count * bone_count) * 10, border_instance.y + border_instance.down + 25, bone, 0, 0, 0, 0);
			}
			if (side == dir.left) {
				bone_instances[i] = create_bone(border_instance.x - border_instance.left - 25, border_instance.y - border_instance.up + (i - loop_count * bone_count) * 10, bone, 0, 0, 0, 270);
			}
			if (side == dir.right) {
				bone_instances[i] = create_bone(border_instance.x + border_instance.right + 25, border_instance.y - border_instance.up + (i - loop_count * bone_count) * 10, bone, 0, 0, 0, 90);
			}
			++i;
		}
		
		draw_warning(side, warning_scale);
		
		if (is_double) {
			switch (side) {
				case dir.up:
					side = dir.right;
					break;
				case dir.down:
					side = dir.left;
					break;
				case dir.left:
					side = dir.up;
					break;
				case dir.right:
					side = dir.down;
					break;
			}
		}
		loop_count++;
	}
	audio_play_sound_plugging(snd_warning);
}

update_up = function() {
	var i = 0;
	repeat(is_double ? bone_count * 2 : bone_count) {
		bone_instances[i].change_scale(bone_scale, 0.2);
		++i;
	}
	instance_destroy(obj_warning);
	audio_play_sound_plugging(snd_spare_up);
}

update_down = function() {
	var i = 0;
	repeat(is_double ? bone_count * 2 : bone_count) {
		bone_instances[i].change_scale(0, 0.2);
		++i;
	}
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