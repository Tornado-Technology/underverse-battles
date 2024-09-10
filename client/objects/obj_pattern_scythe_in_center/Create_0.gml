callback = function() {
	 create_soul(border_instance.x + 20, border_instance.y, battle_soul_type.red);
	
	var scythe_count = 20;

	instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight, scythe, {
		rotation_speed_const: 2 + _power * 0.1
	});
		
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
	audio_play_sound_plugging(snd_emergence);
}

update = function() {
	var position_x;
	var position_y;
	var position; 
	var angle;
	
	if(fight_random_integer(0, 1)) {
		position_x = fight_random_choose(border_instance.x - border_instance.left - 80, border_instance.x + border_instance.right + 80);	
		position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		angle = point_direction(position_x, position_y, border_instance.x, position_y);
	} else {
		position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right - 10);
		position_y = fight_random_choose(border_instance.y - border_instance.up - 80, border_instance.y + border_instance.down + 80);	
		angle = point_direction(position_x, position_y, position_x, border_instance.y);
	};
	
	var feathers_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, feathers);
	
	feathers_instance._speed =  2.1 + _power * 0.1
	feathers_instance._target_angle = angle;
}

time_source_update = time_source_create(time_source_game, (60 - _power) / 60, time_source_units_seconds, function () {
	update();	
}, [], -1)


time_source_update_destroy = time_source_create(time_source_game, (300 / 60) + _power * 2, time_source_units_seconds, function () {
	instance_destroy();
});