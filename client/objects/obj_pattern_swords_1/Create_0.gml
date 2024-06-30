callback = function () {
	soul_instance = create_soul(border_instance.x - border_instance.left + 20, border_instance.y, battle_soul_type.red);
		


	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}


update = function () {

	var position_x;
	var position_y;
	var angle;
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	var random_position = rand_side_from(va_x1_,va_y1_, va_x2_, va_y2_);
	var swords_instance = instance_create_depth(random_position[0], random_position[1], fight_depth.bullet_outside, obj_swords_xanastasia, {
		speed_count: 3 + _power * 0.1,
		image_xscale: 1.5,
		image_yscale: 1.5
	});
		
	if(fight_random_integer(0, 1)) {
		position_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		position_y = choose(border_instance.y - border_instance.up - 20, border_instance.y + border_instance.down + 20);
			angle = point_direction(position_x, position_y, position_x, border_instance.y);
			
	} else {
		position_x = choose(border_instance.x - border_instance.left - 20, border_instance.x + border_instance.right + 20);
		position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		angle = point_direction(position_x, position_y, border_instance.x, position_y);
	}
		
	swords_instance.disable_surface = true;
	swords_instance.moving_target(position_x, position_y, angle);
	swords_instance.image_angle = angle;
			
		
		
}


time_source_update = time_source_create(time_source_game, (50 - _power) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});