//Arguments: slime, platform, fist_capture, fist

callback = function () {
	var time = 0.1 + _power * 0.01;
	soul_instance = create_soul(border_instance.x, border_instance.y - 30, battle_soul_type.red);
	
	
	platforms_01 = create_moving_platforms(border_instance.x - border_instance.left + 20, border_instance.y - 20, 1, -7, 0, 0, platform);
	platforms_02 = create_moving_platforms(border_instance.x, border_instance.y - 20, 1, -6, 0, 0, platform);
	platforms_03 = create_moving_platforms(border_instance.x + border_instance.right - 30, border_instance.y - 20, 1, -7, 0, 0, platform);
		
	slime_yscale = 20;
	
	slime_instnace = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, fight_depth.bullet_outside, slime, {
		image_xscale: 15,
	});
	
	slime_instnace.back_const = 15;
	slime_instnace.change_scale(slime_yscale, time);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_capture);
	time_source_start(time_source_update_destroy);
};

update_capture = function () {	
var left_soul = collision_rectangle(border_instance.x - border_instance.left + 25, border_instance.y - border_instance.up, border_instance.x - border_instance.left + 70, border_instance.y - border_instance.up + 20, soul_instance, false, false);
var right_soul = collision_rectangle(border_instance.x + border_instance.right - 25, border_instance.y - border_instance.up, border_instance.x + border_instance.right - 70, border_instance.y - border_instance.up + 20, soul_instance, false, false);
var angle = 90;
var speed_count = 2 + _power * 0.3;
	
if (!instance_exists(fist_capture)) {
		var fist_instance;
		var target_beginning; 
		var target_end;
		
		if (left_soul != noone) {
			 fist_instance = instance_create_depth(border_instance.x - border_instance.left + 70, border_instance.y + border_instance.down + 10, fight_depth.bullet_outside, fist_capture, {
				image_angle: angle,
				speed_count: speed_count	
			});
			
			target_beginning = new Vector2(fist_instance.x, border_instance.y - border_instance.up);
			target_end = new Vector2(fist_instance.x, border_instance.y + border_instance.down);	
			 fist_instance.target(target_beginning, target_end);	
		} else if (right_soul != noone) {
			fist_instance =	instance_create_depth(border_instance.x + border_instance.right - 70, border_instance.y + border_instance.down + 10, fight_depth.bullet_outside, fist_capture, {
				image_angle: angle,
				speed_count: speed_count	
			});
			
			 target_beginning = new Vector2(fist_instance.x, border_instance.y - border_instance.up);
			 target_end = new Vector2(fist_instance.x, border_instance.y + border_instance.down);
			 fist_instance.target(target_beginning, target_end);	
		};	
	};	
	
	
	
}

update = function () {
	slime_instnace.scale_const = fight_random_integer(10, 17);
	var angle = 90;
	var speed_count = 2 + _power * 0.3;
	var i = fight_random_integer(0, 2);
	var platform_x = [platforms_01[0].x, platforms_02[0].x,  platforms_03[0].x];
		var fist_ = instance_create_depth(platform_x[i], border_instance.y + border_instance.down - 20, fight_depth.bullet_outside, fist, {
			image_angle: angle,
			speed_count: speed_count
		});
		fist_.step = 0.2;
 };
 
var period = 33 - (_power * 2);
var repeats = 5 + (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, (period) / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_capture = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	update_capture();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});