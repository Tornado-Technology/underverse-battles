callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	var position_x = border_instance.x - border_instance.left - 50;
	var position_y = border_instance.y;
		
	var scythe_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, scythe, {
		speed_count: 3 + _power * 0.1	
	});
	
	scythe_instance.moving_arena(border_instance.x, border_instance._inst_frame_up.sprite_width);
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
		position_x = fight_random_choose(border_instance.x - border_instance.left - 60, border_instance.x + border_instance.right + 60);	
		position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		position = new Vector2(position_x == border_instance.x - border_instance.left - 60 ? border_instance.x + border_instance.right - 40 : border_instance.x - border_instance.left + 40, position_y);
		angle = point_direction(position_x, position_y, border_instance.x, position_y);
	} else {
		position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right - 10);
		position_y = fight_random_choose(border_instance.y - border_instance.up - 60, border_instance.y + border_instance.down + 60);	
		position = new Vector2(position_x, position_y == border_instance.y - border_instance.up - 40 ? border_instance.y + border_instance.down - 40 : border_instance.y - border_instance.up + 40);
		angle = point_direction(position_x, position_y, position_x, border_instance.y);
	};
	
	var sctyhe_speed = 3 + _power * 0.1;
	var feathers_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, feathers, {
		speed_count: sctyhe_speed,
		rotating_speed_count: sctyhe_speed,
	});
	
	feathers_instance._target_angle = angle;
}

var period = (60 - _power);
var repeats = 5 + _power; 

time_source_update = time_source_create(time_source_game, (period) / 60, time_source_units_seconds, function () {
	update();	
}, [], repeats - 1);


time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 , time_source_units_seconds, function () {
	instance_destroy();
});