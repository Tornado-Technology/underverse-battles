/// Arguments: big_star, star

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	var star_big_instance = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside, big_star, {
	});	
			
	star_big_instance.speed_torsional = 1 + _power * 0.2;
	
			
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
};

update = function () {
	var radius = 240;
	var angle_offset = fight_random_integer(1, 360);
	var _lengthdir_x = lengthdir_x(radius, angle_offset);
	var _lengthdir_y = lengthdir_y(radius, angle_offset);		
	
	repeat (_power div 2 + 3) {	
		var	star_instance = instance_create_depth(border_instance.x + _lengthdir_x,  border_instance.y + _lengthdir_y, fight_depth.bullet_outside, star);
			star_instance.speed_const = 3 + _power * 0.1;
			star_instance.direction = point_direction(star_instance.x, star_instance.y, soul_instance.x, soul_instance.y);
	};
	
	audio_play_sound_once(snd_projectile);
};

var period = 33 - 2 * _power;
var repeats = 10 + _power * 2;


if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});