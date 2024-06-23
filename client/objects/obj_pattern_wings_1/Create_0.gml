callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_feathers);
	time_source_start(time_source_update_destroy);
}

update = function() {
		var x_ = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		var y_ = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
		
		var feathers_instnace = instance_create_depth(x_, y_, fight_depth.bullet_outside_hight, obj_aim_hit, 
		{
			angle: choose(360, 120), 
			time_prejudice: 20
		});		
		
		with(feathers_instnace) {
			end_prejudice  = function () {
				instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_knilage_blow_xsanastasia, {
					image_angle: (angle / aim_count)	
				});		
			};
			
		}
}

update_feathers = function () {
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	var random_position = rand_side_from(va_x1_,va_y1_, va_x2_, va_y2_);
	
	instance_create_depth(random_position[0], random_position[1], 0, obj_feathers_xanastasia, {
		_target_angle: point_direction(random_position[0], random_position[1], soul_instance.x, soul_instance.y),
	});
		
		
}

time_source_update = time_source_create(time_source_game, (100 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);




time_source_update_feathers = time_source_create(time_source_game, (40 - _power) / 60, time_source_units_seconds, function () {
	update_feathers();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});