/// Arguments: star_spinning

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	var distance_factor = 0;
	var speed_step = 0.1;
	
	repeat (_power div 1 + 2) {
		var spawn_option_index = irandom_range(0, 3);
		var distance = choose(-25, -20, -17, 17, 20, 25);
		
		switch (spawn_option_index) {
			case 0:
				var star_instance = instance_create_depth(border_instance.x + border_instance.right + 8, soul_instance.y - distance * distance_factor, fight_depth.bullet_outside, star_spinning);
				star_instance.speed_const = 3 + _power * speed_step;
				star_instance.direction_const = 180;
				break;
			case 1 :
				var star_instance = instance_create_depth(border_instance.x + border_instance.right + 8, soul_instance.y + distance * distance_factor, fight_depth.bullet_outside, star_spinning);
				star_instance.speed_const = 3 + _power * speed_step;
				star_instance.direction_const = 180;	
				break;
			case 2 :		
				var star_instance = instance_create_depth(border_instance.x - border_instance.left - 8, soul_instance.y - distance * distance_factor, fight_depth.bullet_outside, star_spinning);
				star_instance.speed_const = 3 + _power * speed_step;		
				break;
			case 3 :
				var star_instance = instance_create_depth(border_instance.x - border_instance.left - 8, soul_instance.y + distance * distance_factor, fight_depth.bullet_outside, star_spinning);
				star_instance.speed_const = 3 + _power * speed_step;			
				break;
		}
		distance_factor += 1.6;
	}
	audio_play_sound_plugging(snd_projectile);
}

var period = 30 - 2 * _power;
var repeats = 10 + _power * 2;


if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});