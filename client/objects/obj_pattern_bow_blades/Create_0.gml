// Arguments bow, arrow, blades

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	var i = 0;
	var offset = 180;
	repeat(2) {
		instance_create_depth(border_instance.x - border_instance.left  + 10 + (offset * i), border_instance.y - border_instance.down - 20, fight_depth.bullet_outside_hight, blades, {
			center_x: border_instance.x,
			center_y: border_instance.y + 30,
			radius: 40,
			image_angle: 90,
			direction: 0 + (offset * i),
			speed_count: 1 + _power * 0.1,
			speed_spinnig: 3 + _power * 0.1
		});
		i++;
	}
	
	
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	var angle = fight_random_integer(30, 360);
	var radius = 120;
	var target = point_direction(border_instance.x + dcos(angle) * radius, border_instance.y + -dsin(angle) * radius, soul_instance.x, soul_instance.y);
	create_bow(bow, arrows, 3 + _power * 0.1, fight_random_integer(1, 100) <= (15 + _power * 10), border_instance.x + dcos(angle) * radius, border_instance.y + -dsin(angle) * radius,  target, 1 / 6,  0.7 - _power * 0.1,  0.5 - _power * 0.1);
}


var period = 45 - (_power * 2);
var period_star = 10;
var repeats = 10 + _power * 2;



time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], repeats -1);

time_source_update_destroy = time_source_create(time_source_game,  (period * repeats) / 60 + 1, time_source_units_seconds, function () {
instance_destroy();	
});	
	