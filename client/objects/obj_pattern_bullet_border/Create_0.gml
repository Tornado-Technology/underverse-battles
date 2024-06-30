
border_instance.y += 20;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
				
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var radius = 130;
	var angle = fight_random_choose(135, 45, 225, 315);
	var x_ = soul_instance.x + dcos(angle) * radius;
	var y_ = soul_instance.y + -dsin(angle) * radius;
	var bullet_instance = instance_create_depth(x_, y_, fight_depth.bullet_outside_hight, obj_bullet_clubs_jevil, {
		speed_count: 3 + _power * 0.1,
		step: 0.9 + _power * 0.01,
		center_x: soul_instance.x,
		center_y: soul_instance.y,
		angle: angle
	});
	
	bullet_instance.count_repeat_spwan = _power div 2 + 3;
	
}

time_source_update = time_source_create(time_source_game, (40 - (_power * 2)) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {

	instance_destroy();
});