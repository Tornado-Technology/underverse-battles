//Arguments: slime, platform, fist_capture, fist
slime_xscale = 10;


callback = function () {
	soul_instance = create_soul(border_instance.x - 50, border_instance.y - 30, battle_soul_type.red);
	
	platforms_01 = create_moving_platforms(border_instance.x - border_instance.left + 12, border_instance.y - 20, 1, -6, 0, 0, platform);
	platforms_02 = create_moving_platforms(border_instance.x - 10, border_instance.y - 20, 1, -6, 0, 0, platform);
	platforms_03 = create_moving_platforms(border_instance.x + border_instance.right - 20, border_instance.y - 20, 1, -6, 0, 0, platform);
	
	var time = 0.1 + _power * 0.01;
	 slime_instnace = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, fight_depth.bullet_outside, slime, {
		image_xscale : round((border_instance.left + border_instance.right))
	});
	
	slime_instnace.change_scale(slime_xscale, time);
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	slime_instnace.scale_const = irandom_range(10, 17);
	var angle = 90;
	var speed_count = 2 + _power * 0.3;
	var left_soul = collision_rectangle(border_instance.x - border_instance.left + 20, border_instance.y - border_instance.up, border_instance.x - border_instance.left + 60, border_instance.y + border_instance.down, soul_instance, false, false);
	var right_soul = collision_rectangle(border_instance.x + border_instance.right - 70, border_instance.y - border_instance.up, border_instance.x + border_instance.right - 25, border_instance.y + border_instance.down, soul_instance, false, false);
		
	var i = irandom_range(0, 2);
	var platform_x = [platforms_01[0].x, platforms_02[0].x,  platforms_03[0].x];
		instance_create_depth(platform_x[i], border_instance.y + border_instance.down, fight_depth.bullet_outside, fist, {
			image_angle: angle,
			speed_count: speed_count
		});
		
	if (!instance_exists(fist_capture)) {
		if (left_soul != noone) {
		
			var fist_instance =	instance_create_depth(border_instance.x  - border_instance.left + 50, border_instance.y + border_instance.down, fight_depth.bullet_outside, fist_capture, {
				image_angle: angle,
				speed_count: speed_count	
			});
	
			var target_beginning = new Vector2(fist_instance.x, border_instance.y - border_instance.up);
			var target_end = new Vector2(fist_instance.x, border_instance.y + border_instance.down);
			fist_instance.target(target_beginning, target_end);
		}
		else if (right_soul != noone) {
		
			var fist_instance =	instance_create_depth(border_instance.x + border_instance.right - 50, border_instance.y + border_instance.down, fight_depth.bullet_outside, fist_capture, {
				image_angle: angle,
				speed_count: speed_count	
			});
		
			var target_beginning = new Vector2(fist_instance.x, border_instance.y - border_instance.up);
			var target_end = new Vector2(fist_instance.x, border_instance.y + border_instance.down);
			fist_instance.target(target_beginning, target_end);	
		};
	};
 };
 
var period = 33 - 2 * _power;
var repeats = 5 + _power * 3;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});