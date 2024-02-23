/// Arguments: big_star, star

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	star_big_instance = instance_create_depth(border_instance.x - 1, border_instance.y, fight_depth.bullet_outside, big_star);	
			
	star_big_instance.speed_torsional = 0.8 + _power * 0.2;
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);	
}

update = function () {
	var star_position = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);	
	var	star_instance = instance_create_depth(star_position[0],  star_position[1], fight_depth.bullet_outside, star);
	star_instance.speed_const = 2.5 + _power * 0.2;
	star_instance.direction = point_direction(star_instance.x, star_instance.y, soul_instance.x, soul_instance.y);
	
	audio_play_sound_plugging(snd_projectile);
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