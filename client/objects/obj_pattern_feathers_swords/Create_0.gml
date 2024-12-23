/// Arguments: swords, feathers
callback = function () {
	soul_instance = create_soul(border_instance.x - border_instance.left + 20, border_instance.y, battle_soul_type.red); 

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_swords);
	time_source_start(time_source_update_destroy);
}

update_swords = function() {
	var position_x;
	var position_y;
	var position; 
	var scale = 3;
	var angle;
	var offset = -5;
	if (fight_random_integer(0, 1)) {
		position_x =  fight_random_choose(border_instance.x - border_instance.left - 60, border_instance.x + border_instance.right + 60);	
		position_y = fight_random_integer(border_instance.y - border_instance.left + 10, border_instance.y + border_instance.down - 10);
		position = new Vector2(position_x == border_instance.x - border_instance.left - 60 ? border_instance.x + border_instance.right - offset : border_instance.x - border_instance.left + offset, position_y);
		angle = point_direction(position_x, position_y, border_instance.x, position_y);
	} else {
		position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right - 10);
		position_y =  fight_random_choose(border_instance.y - border_instance.up - 40, border_instance.y + border_instance.down + 40);	
		position = new Vector2(position_x, position_y == border_instance.y - border_instance.up - 40 ? border_instance.y + border_instance.down - offset : border_instance.y - border_instance.up + offset);
		angle = point_direction(position_x, position_y, position_x, border_instance.y);
	}
	
	var scythe_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, swords, {
		speed_count: 3 + _power * 0.1
	});
	
	scythe_instance.disable_surface = true;
	scythe_instance.step = 0.05 + _power * 0.01;
	scythe_instance.gradually_appearing();
	scythe_instance.image_angle = angle + 180;
	scythe_instance.target_places(position, true);
}

update = function() {
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	var random_position = rand_side_from(va_x1_, va_y1_, va_x2_, va_y2_);
	
	instance_create_depth(random_position[0], random_position[1], 0, feathers, {
		_target_angle: point_direction(random_position[0], random_position[1], soul_instance.x, soul_instance.y)
	});
}

var period_swords = 52 - (_power * 2);
var period = (50 - _power); 
var repeats = 5 + (_power * 2);

time_source_update_swords = time_source_create(time_source_game, period_swords  / 60, time_source_units_seconds, function() {
	update_swords();
}, [], repeats - 1);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (period_swords * repeats) / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});