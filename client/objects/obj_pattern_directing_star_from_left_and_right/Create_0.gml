/// Arguments: star_spinning

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	var distance_factor = 5;
	var speed_step = 0.1;
	var star_instance = [];

	var i = 0;
	var j = 1;
	repeat (_power div 2 + 3) {
		var x_ = fight_random_choose(border_instance.x - border_instance.left - fight_random_integer(20, 90), border_instance.x + border_instance.right + fight_random_integer(20, 90));
		var y_ = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	
		star_instance[i] = instance_create_depth(x_, y_, fight_depth.bullet_outside_hight, star);

		star_instance[i].direction = point_direction(x_, y_, border_instance.x, y_);
		star_instance[i].speed_const = 3 + _power * speed_step;
		i++;
	}

	
	audio_play_sound_plugging(snd_projectile);
}

var period = 36 - (_power * 2);
var repeats = 10 + _power * 2;


if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});