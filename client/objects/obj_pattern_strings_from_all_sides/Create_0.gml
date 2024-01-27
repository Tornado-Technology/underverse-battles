// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);

	update(_power);
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
}

update = function() {
	var coord = [];
	coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	create_error_string(coord[0], coord[1], thread, soul_instance.x, soul_instance.y, 3.4 + _power * 0.1, fight_network_mode);
}
	
update_bone = function() {
	var coord = [];
	coord = rand_side_from(border_instance.x - border_instance.left - 15, border_instance.y - border_instance.up - 15, border_instance.x + border_instance.right + 15, border_instance.y + border_instance.down + 15);
	var bone_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	create_bone(coord[0], coord[1], bone, 4, 1, bone_direction, bone_direction - 90, fight_network_mode);
	audio_play_sound_plugging(snd_projectile);
}

var period = 38 - _power * 3;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
	
time_source_update_stop = time_source_create(time_source_game, 5, time_source_units_seconds, function () {
	if (!soul_instance.is_stunned) {
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