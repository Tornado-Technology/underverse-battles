// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
		var bow_counst =  _power > 3 ?  4 : _power + 1;
	if (instance_number(bow) <= bow_counst) {
		
		var radius = 120;
		var cross = choose(false, true); 
		var angle_offset = cross ?  360 : 240;
		var angle = angle_offset / bow_counst;
		var i = angle;
		while(i <= angle_offset) {
			bow_instance = instance_create_depth(border_instance.x + dcos(i) * radius, border_instance.y + -dsin(i) * radius, fight_depth.bullet_outside_hight, bow, {
			target_time: 0.2,
			shot_time: 0.7 - _power * 0.1,
			destroy_time: 0.5,
			_power: _power,
			arrows: arrows,
			speed_const : 2 + _power * 0.1
			});

			i += angle;
		}
	}
}
var period = 35 - 1 - _power * 2;
var repeats = 20 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], repeats - 1);


time_source_update_destroy = time_source_create(time_source_game,  period * (repeats + 1) / 60, time_source_units_seconds, function () {
instance_destroy();	
});	
	