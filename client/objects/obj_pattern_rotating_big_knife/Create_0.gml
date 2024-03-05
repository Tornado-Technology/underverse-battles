// Arguments: big_knife

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	knife_instance = create_big_knife_x(border_instance.x - border_instance.left - 30, border_instance.y, big_knife, 0, 0, border_instance.x + border_instance.right + 20);
			
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	knife_instance.spin(fight_random_choose(-1, 1) * (3 + _power * 0.2));
	knife_instance.move(3 + _power * 0.2);
	audio_play_sound_once(snd_projectile);
	
}

time_source_update = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	update();
});
	
time_source_update_destroy = time_source_create(time_source_game, (240 + 70 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});