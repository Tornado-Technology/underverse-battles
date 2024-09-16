//Arguments: tentacles

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	 border_up = border_instance.y - border_instance.up;
	 border_down = border_instance.y + border_instance.down;
	 
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var speed_tentacles =  0.04; 
	var tentacles_const = (_power > 2 ? 2 : _power div 2 + 2);
	
	repeat(tentacles_const){	
		var coord = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		
		var tentacles_instance_0 = instance_create_depth(coord, border_up, fight_depth.bullet_outside_hight, tentacles, {
			image_xscale: 0,
			image_angle: 270
		 });
		
		var tentacles_instance_1 = instance_create_depth(coord, border_down, fight_depth.bullet_outside_hight, tentacles, {
			image_xscale: 0,
			image_angle: 90,
		 });
		tentacles_instance_0.change_scale(1.3, speed_tentacles);
		tentacles_instance_1.change_scale(1.3, speed_tentacles);	
	} 
}

 
var period = 33 - (_power * 2);
var repeats = 15 + (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});