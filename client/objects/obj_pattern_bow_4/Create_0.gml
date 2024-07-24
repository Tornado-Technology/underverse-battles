// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	var up = fight_random_choose(false, true);
	var spwan_star =  fight_random_choose(true, false);
	var orange =  fight_random_integer(1, 100);
	
	var radius = 120;
	var angle = fight_random_integer(0, 360);
	var offset = fight_random_integer(20, 50);
	var arrow_ =  orange <= 25 ? (spwan_star ? arrows_orange_star : arrows_orange) : (spwan_star ? arrows_star : arrows);
	var border = up ? border_instance.x - border_instance.up - offset : border_instance.x + border_instance.down + offset;
	 instance_create_depth(border_instance.x + dcos(angle) * radius, border + -dsin(angle) * radius, fight_depth.bullet_outside_hight, bow, {
			target_time: 0.2 - _power * 0.01,
			shot_time: 0.7 - _power * 0.01,
			destroy_time: 0.5,
			_power: _power,
			arrows: arrow_,
			speed_const : 2 + _power * 0.5
		});
}
var period = 33 - 3 - _power * 2;
var repeats = 20 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], repeats - 1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
instance_destroy();	
});	
	