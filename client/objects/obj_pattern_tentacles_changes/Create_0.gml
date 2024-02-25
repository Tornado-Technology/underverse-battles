//Arguments: tentacles

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	var border_right = border_instance.x + border_instance.right;	
	var border_up = border_instance.y - border_instance.up;
	var border_down = border_instance.y + border_instance.down;
	
	var i = 0;
	repeat (10) {
	var end_start = 0.07;
	end_start -= random_range(0.01, 0.05);
	
	var tentacles_instance_0 = instance_create_depth(border_right - 21 * i, border_up, fight_depth.bullet_outside_hight, tentacles, {
		image_xscale: 0,
		image_angle : 270
	 });
	 	 
	var tentacles_instance_1 = instance_create_depth(border_right - 21 *  i, border_down, fight_depth.bullet_outside_hight, tentacles, {
		image_xscale: 0,
		image_angle : 90
	 });
	 var back_time =  0.1 + _power * 0.1;
	 tentacles_instance_0.back_time =  back_time;
	 tentacles_instance_0.change_scale(1.3, 3, end_start);
	 
	 end_start = 0.07;
	 end_start -= random_range(0.01, 0.05);
	 tentacles_instance_1.back_time = back_time;
	 tentacles_instance_1.change_scale(1.3, 3, end_start);
	  i++;
	}
	
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	
 };
 
var period = 33 - 2 * _power;
var repeats = 15 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 30, time_source_units_seconds, function () {
	instance_destroy();
});