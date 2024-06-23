// Arguments: bomb,  spike

	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	monster_instance = instance_create_depth(border_instance.x, border_instance.y - border_instance.up - 80, fight_depth.bullet_outside_hight, obj_monster_nightmare, {
		image_xscale: 1.2,
		image_yscale: 1.2
		
	});
	

	

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_start);	
};

update_start = function () {	
	
}	

update = function () {

	
}

 
var period = 100;
var repeats = 5 + ( 5 + _power) * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update_start = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	update_start();
}, [], -1);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});