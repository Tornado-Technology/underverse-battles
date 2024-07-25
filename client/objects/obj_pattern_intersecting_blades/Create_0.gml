// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	blades_instance = instance_create_depth(border_instance.x - border_instance.left - 50, border_instance.y, fight_depth.bullet_outside_hight, blades_swing);
	instance_create_depth(border_instance.x - border_instance.left  + 10, border_instance.y - border_instance.down - 20, fight_depth.bullet_outside_hight, blades_moving_y, {
		center_x: border_instance.x,
		center_y: border_instance.y + 30,
		radius: 40,
		radius_y: 30,
		image_angle: 90,
		direction: 0,
		speed_count: 1 + _power * 0.1,
		speed_spinnig: 3 + _power * 0.1
	});
	
	blades_instance.direction = 0;
	blades_instance.image_angle = 0;
	blades_instance.point_stop_x = border_instance.x + border_instance.right + 20;
	
	blades_instance.speed_const = 1 + _power * 0.1;

	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

time_source_update = time_source_create(time_source_game, 0.1, time_source_units_seconds, function () {
	blades_instance.move(2 + _power * 0.1);
	blades_instance.move_spinning(5 + _power * 0.1);	
});

time_source_update_destroy = time_source_create(time_source_game, 5 + _power, time_source_units_seconds, function () {
	instance_destroy();	
});