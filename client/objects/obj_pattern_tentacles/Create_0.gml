callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
	
	update();

};

update = function () {
	 
	var tentacles_instance = instance_create_depth(border_instance.x, soul_instance.y, fight_depth.bullet_outside_hight, tentacles, {
		target : soul_instance,
		target_time : 16 / 2
	 });
	 
	 tentacles_instance.tc_x = soul_instance.x;
	 tentacles_instance.tc_y = soul_instance.y;
 };
 
var period = 33 - 2 * _power;
var repeats = 10 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period,time_source_units_seconds, function () {
update();		 
});

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});