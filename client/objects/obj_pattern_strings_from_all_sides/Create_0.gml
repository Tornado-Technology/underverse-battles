// Arguments: bone, thread

callback = function () {
	_soul = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	update(_power);
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
}

update = function() {
	var coord = [];
	coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
	var blue_string = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, thread);
	blue_string.x_dir = _soul.x;
	blue_string.y_dir = _soul.y;
	blue_string.scale_speed = 3.4 + _power * 0.1;
	
	audio_play_sound_plugging(snd_string);
}
	
update_bone = function() {
	var coord = [];
	coord = rand_side_from(border_instance.x - border_instance.left - 15, border_instance.y - border_instance.up - 15, border_instance.x + border_instance.right + 15, border_instance.y + border_instance.down + 15);
	var bone_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, bone);
	bone_instance.direction = point_direction(bone_instance.x, bone_instance.y, _soul.x, _soul.y);
	bone_instance.image_angle = bone_instance.direction - 90;
	bone_instance.speed_const = 4;
	audio_play_sound_plugging(snd_projectile);
}

var period = 38 - _power * 3;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
	
time_source_update_stop = time_source_create(time_source_game, 5, time_source_units_seconds, function () {
	if (!_soul.is_stunned) {
		instance_destroy();
	}
	else {
		time_source_start(time_source_update_bone);
		time_source_start(time_source_update_destroy);
	}
});

var repeats = 1 + _power;
time_source_update_bone = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
	update_bone();
}, [], repeats);

time_source_update_destroy = time_source_create(time_source_game, repeats * 1/6 + 1, time_source_units_seconds, function () {
		instance_destroy();
});