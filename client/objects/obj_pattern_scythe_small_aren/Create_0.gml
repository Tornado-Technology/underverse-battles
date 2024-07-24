/// Arguments: scythe_small

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		var scythe_counst = _power div 3 + 4;
		var angle = 360 / scythe_counst;
		var radius = 150
		var i = angle;
		
		while(i <= 360) {
			var _x = border_instance.x;
			var _y = border_instance.y
			
			
			var scythe_instance = instance_create_depth(_x + dcos(i) * radius, _y + -dsin(i) * radius, fight_depth.bullet_outside_hight, scythe_small, {
				center_x: border_instance.x,
				center_y: border_instance.y
			});
			
			scythe_instance.step_radius = 2 + _power * 0.1;
			scythe_instance.step = 2 + _power * 0.3;
			i += angle;
		}
		
	time_source_start(time_source_update_destroy);
}

time_source_update_destroy = time_source_create(time_source_game, (250 / 60) + _power * 2, time_source_units_seconds, function () {
	instance_destroy();
});