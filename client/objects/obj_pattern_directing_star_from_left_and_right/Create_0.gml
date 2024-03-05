/// Arguments: star_spinning

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	
	var i = 0;
	var _speed = 0.1;
	
	repeat (_power div 1 + 2) {
		var size = fight_random_integer(0, 3);
		
		var decrease = fight_random_choose(-25, -20, -17, 17, 20, 25);
		switch (size) {
			case 0:
					var star_instance = instance_create_depth(border_instance.x + border_instance.right, soul_instance.y - decrease * i, fight_depth.bullet_outside, star_spinning);
					star_instance.speed_const = 3 + _power * _speed;
					star_instance.direction_const = 180;
					break;
	
			case 1 :
					var star_instance = instance_create_depth(border_instance.x + border_instance.right, soul_instance.y + decrease * i, fight_depth.bullet_outside, star_spinning);
					star_instance.speed_const = 3 + _power * _speed;
					star_instance.direction_const = 180;	
					break;
	
			case 2 :		
					var star_instance = instance_create_depth(border_instance.x - border_instance.left, soul_instance.y - decrease * i, fight_depth.bullet_outside, star_spinning);
					star_instance.speed_const = 3 + _power * _speed;		
					break;
	
			case 3 :
					var star_instance = instance_create_depth(border_instance.x - border_instance.left, soul_instance.y + decrease * i, fight_depth.bullet_outside, star_spinning);
					star_instance.speed_const = 3 + _power * _speed;			
					break;
			};
				
	 i += 1.6;
	};
		audio_play_sound_once(snd_projectile);
};

var period = 30 - 2 * _power;
var repeats = 10 + _power * 2;


if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.2, time_source_units_seconds, function () {
	instance_destroy();
});