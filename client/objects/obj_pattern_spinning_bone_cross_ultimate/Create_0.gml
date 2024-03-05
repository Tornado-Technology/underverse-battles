// Arguments: bone_spinning, bone/knife, gasterblaster_aiming

bone_instances = [];

callback = function () {
	side_random = fight_random_choose(dir.up, dir.down, dir.left, dir.right);

	var soul_position = new Vector2(border_instance.x, border_instance.y - border_instance.up + 15);
	if (side_random == dir.down) {
		soul_position =new Vector2(border_instance.x, border_instance.y + border_instance.down - 15);
	}
	if (side_random == dir.left) {
		soul_position = new Vector2(border_instance.x - border_instance.left + 15, border_instance.y);
	}
	if (side_random == dir.right) {
		soul_position = new Vector2(border_instance.x + border_instance.right - 15, border_instance.y);
	}
	soul_instance = create_soul(soul_position.x, soul_position.y, battle_soul_type.red);

	var bone_scale = 9.4;
	bone_instances[0] = create_spinning_bone(border_instance.x, border_instance.y, bone_spinning, 0, 0, 45, -45, 0);
	bone_instances[0].change_scale(bone_scale, 0.1);
	bone_instances[1] = create_spinning_bone(border_instance.x, border_instance.y, bone_spinning, 0, 0, 135, 45, 0);
	bone_instances[1].change_scale(bone_scale, 0.1);
	audio_play_sound_once(snd_spare_up);

	time_source_start(time_source_update_3_0);
}

update_3_0 = function() {
	var bone_angle_speed = fight_random_choose(1, -1);
	bone_instances[0].angle_speed = bone_angle_speed;
	bone_instances[1].angle_speed = bone_angle_speed;
}
	
update_3_1 = function() {
	create_aiming_gasterblaster(gasterblaster_aiming, soul_instance);
}
	
update_3_2 = function() {
	var rand_side = rand_side_from(border_instance.x - border_instance.left - 15, border_instance.y - border_instance.up - 15, border_instance.x + border_instance.right + 15, border_instance.y + border_instance.down + 15);
	var object_direction = point_direction(rand_side[0], rand_side[1], soul_instance.x, soul_instance.y);
	
	if (variable_instance_exists(id, "bone")) {
		var bone_speed = 2.2;
		create_bone(rand_side[0], rand_side[1], bone, bone_speed, 1, object_direction, object_direction - 90);
	}
	if (variable_instance_exists(id, "knife")) {
		instance_create_depth(rand_side[0], rand_side[1], fight_depth.bullet_outside, knife, {
			image_alpha: 0,
			_target_angle: object_direction
		});
	}
	audio_play_sound_plugging(snd_projectile);
}
	
update_3_3 = function() {
	bone_instances[0].change_scale(0, 0.1);
	bone_instances[1].change_scale(0, 0.1);
}

time_source_update_3_0 = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	update_3_0();
	time_source_start(time_source_update_3_1);
	time_source_start(time_source_update_stop_3_1);
});

var period = 25;
var repeats = 4;
time_source_update_3_1 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_3_1();
}, [], repeats);
	
time_source_update_stop_3_1 = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	time_source_start(time_source_update_3_2);
	time_source_start(time_source_update_stop_3_2);
});
	
time_source_update_stop_3_3 = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	update_3_3();
	time_source_start(time_source_update_destroy);
});
	
period = 20;
repeats = 5;
time_source_update_3_2 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_3_2();
}, [], repeats);
	
time_source_update_stop_3_2 = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	time_source_start(time_source_update_3_1);
	time_source_start(time_source_update_stop_3_3);
});
	
time_source_update_destroy = time_source_create(time_source_game, 1.2, time_source_units_seconds, function () {
	instance_destroy(bone_instances[0]);
	instance_destroy(bone_instances[1]);
	instance_destroy();
});