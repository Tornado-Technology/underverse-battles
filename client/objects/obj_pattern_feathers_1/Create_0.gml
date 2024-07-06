		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	var i = 0;
	var offset = 50;
	repeat(3) {	
		var feathers_instance = instance_create_depth(border_instance.x, -obj_camera.view_height, fight_depth.bullet_outside, obj_feathers_radius_xanastasia, {
			center_x: border_instance.x,
			center_y: (border_instance.y - 60) + offset * i,
			speed_radius: (2 + _power * 0.1),
			radius_y: 40
		});
		feathers_instance.radius = 40;
		i++;
	}
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	
}

time_source_update = time_source_create(time_source_game, 70 - (_power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});