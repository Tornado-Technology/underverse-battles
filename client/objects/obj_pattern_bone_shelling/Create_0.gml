// Arguments: bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_x = choose(border_instance.x - border_instance.left - 10, border_instance.x + border_instance.right + 10);
	var bone_dir = point_direction(random_x, border_instance.y - border_instance.up - 10, soul_instance.x, soul_instance.y);
	var bone_speed = 2 + 0.2 * _power;
	create_bone(random_x, border_instance.y - border_instance.up - 5, bone, bone_speed, 1, bone_dir, bone_dir - 90, fight_network_mode);
	audio_play_sound_plugging(snd_projectile);
}

var period = 20 - 3 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_stop = time_source_create(time_source_game, (240 + 20 * _power) / 60, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
});
	
time_source_update_destroy = time_source_create(time_source_game, (280 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});