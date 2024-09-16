callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
	audio_play_sound_plugging(snd_emergence);
}

update = function () {
	var position_x;
	var position_y;
	var center_x;
	var center_y;
	var finish_x;
	var finish_y;
	var center;
	var scythe_instance;
	var angle;

	if(fight_random_integer(0, 1)) {
		position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right - 10);
		position_y =  border_instance.y + border_instance.down + 40;
		
		finish_y =  border_instance.y - border_instance.up - 40;
		angle = point_direction(position_x, position_y, position_x, border_instance.y) + 190;
		center = new Vector2(position_x , finish_y) ;	
	} else {
		position_x =  fight_random_choose(border_instance.x - border_instance.left - 30, border_instance.x + border_instance.right + 30);
		position_y = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
		finish_x = position_x == border_instance.x - border_instance.left - 30 ?  border_instance.x + border_instance.right + 30  : border_instance.x - border_instance.left - 30;
		angle = point_direction(position_x, position_y, border_instance.x, position_y) + 190;
		center = new Vector2(finish_x, position_y);
	};
	
	var sctyhe_speed = 3 + _power * 0.1;
	scythe_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, scythe, {
		speed_count: sctyhe_speed,
		rotation_speed_const: sctyhe_speed,
		position_x: center.x,
		position_y: center.y,
		image_angle: angle
	});
	 
	scythe_instance.moving_back();
}

var period = (80 - _power);
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});