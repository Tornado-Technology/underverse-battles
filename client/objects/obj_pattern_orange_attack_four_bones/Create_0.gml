// Arguments: bone, use_gravity_attack, custom_repeats (optional)

bone_instances = [];
bone_count = 4;

callback = function () {
	if (use_gravity_attack)
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	else
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

create_bone_right = function(bone_scale, bone_speed) {
	return create_bone(border_instance.x + border_instance.right + 15, border_instance.y + border_instance.down + 10, bone,
			bone_speed, bone_scale, 90, 90);
}
create_bone_left = function(bone_scale, bone_speed) {
	return create_bone(border_instance.x - border_instance.left - 15, border_instance.y - border_instance.up - 10, bone,
			bone_speed, bone_scale, 270, 270);
}
create_bone_up = function(bone_scale, bone_speed) {
	return create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, bone,
			bone_speed, bone_scale, 180, 180);
}
create_bone_down = function(bone_scale, bone_speed) {
	return create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 15, bone,
			bone_speed, bone_scale, 0, 0);
}

update = function() {
	var side = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	if (use_gravity_attack) {
		soul_instance.change_direction(side);
		audio_play_sound_once(snd_emergence);
	}
		
	instance_destroy_array(bone_instances);
	
	var bone_scale = 4.6;
	var bone_speed = 2 + _power * 0.1;
	if (side == dir.up) {
		bone_instances[0] = create_bone_up(bone_scale, bone_speed);
	}
	if (side == dir.down) {
		bone_instances[0] = create_bone_down(bone_scale, bone_speed);
	}
	if (side == dir.left) {
		bone_instances[0] = create_bone_left(bone_scale, bone_speed);
	}
	if (side == dir.right) {
		bone_instances[0] = create_bone_right(bone_scale, bone_speed);
	}
	
	character_instance.change_sprite_hand_dir(side);
}

var period = 75 - _power * 5;
var repeats = 5 + _power

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();
});