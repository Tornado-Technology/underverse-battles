/// Arguments: swords, feathers

callback = function() {
	soul_instance = create_soul(border_instance.x - border_instance.left + 20, border_instance.y, battle_soul_type.red);
		
	var angle = 360 / 6;
	var i = angle;
	while (i <= 360) {
		var swords_instance = instance_create_depth(border_instance.x + dcos(i) * 10, border_instance.y + -dsin(i) * 10, fight_depth.bullet_outside_hight, swords, {	
			speed_count: 0.5 + _power * 0.1,
		});
		swords_instance.radius = 10;
		swords_instance.radius_max = 80;
		swords_instance.angle = i;
		swords_instance.center(border_instance.x, border_instance.y);
		swords_instance.gradually_appearing();
		
		i += angle;	
	}
	
	update_feathers();
	time_source_start(time_source_update_feathers);
	time_source_start(time_source_update_destroy);
}

update_feathers = function() {
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	var random_position = rand_side_from(va_x1_,va_y1_, va_x2_, va_y2_);
	
	instance_create_depth(random_position[0], random_position[1], 0, feathers, {
		_target_angle: point_direction(random_position[0], random_position[1], soul_instance.x, soul_instance.y),
	});
}

var period = 50 - _power * 2;
var repeats = 7 + _power * 2;

time_source_update_feathers = time_source_create(time_source_game, (period) / 60, time_source_units_seconds, function() {
	update_feathers();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});