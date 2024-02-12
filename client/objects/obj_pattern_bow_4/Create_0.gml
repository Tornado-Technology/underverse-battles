// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
var radius = 70;
var offset = 50;
var _cos = dcos(180) * radius;
var _sin = -dsin(90) * radius;
var j = 0;
repeat (2) { 	
 var _xx = border_instance.x - border_instance.left + offset;
 var _yy = soul_instance.y - offset;
	var bow_instance_02 = instance_create_depth(_xx + _cos + j, _yy, fight_depth.bullet_outside, bow, {
		target_time : 1 - _power * 0.1,
		shot_time : 0.7 - _power * 0.1 ,
		destroy_time : 0.5 - _power * 0.1,
		_power : _power
	});		
		
	j += 180;	
	}	
}
var period = 33 + _power * 2;
var repeats = 20 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 30, time_source_units_seconds, function () {
update();	
}, [], repeats - 1);


time_source_update_destroy = time_source_create(time_source_game,  period * (repeats + 1) / 60, time_source_units_seconds, function () {
	if (instance_exists(bow)) {
		instance_destroy(bow);	
	}
instance_destroy();	
});	
	