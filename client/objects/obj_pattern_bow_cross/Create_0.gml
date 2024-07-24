// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	var angle = irandom_range(30, 360);
	var radius = 120;
	
	var bow_instance = instance_create_depth(border_instance.x + dcos(angle) * radius, border_instance.y + -dsin(angle) * radius, fight_depth.bullet_outside_hight, bow, {	
			target_time: 0.2,
			shot_time: 0.7 - _power * 0.1,
			destroy_time: 0.5,
			_power: _power,
			arrows: arrows,
			speed_const : 2 + _power * 0.1
	});
		
	if (instance_exists(bow)) {
		bow_instance.x +=  bow.x == bow_instance.x ?  dcos(20) : dcos(0);
		bow_instance.y +=  bow.y == bow_instance.y ?  -dsin(20) : -dsin(0);
	};
}


var period = 35 - (1 - _power * 2);
var repeats = 15 + _power * 2;



time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * (repeats) / 60, time_source_units_seconds, function () {
instance_destroy();	
});	
	