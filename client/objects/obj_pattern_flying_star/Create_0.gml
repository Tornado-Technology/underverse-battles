// Arguments: star, sides, is_aiming, custom_repeats (optional)

callback = function () {
	if 	!is_undefined(attack_blades) {
	 soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);		
	}
	else {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	}
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var sides_count = array_length(sides);
	var random_side = sides[irandom_range(0, sides_count - 1)];
	var star_x, star_y;
	if (random_side == dir.up) {
		star_x = is_aiming ? soul_instance.x : irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		star_y = border_instance.y - border_instance.up - 15;
	}
	if (random_side == dir.down) {
		star_x = is_aiming ? soul_instance.x : irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		star_y = border_instance.y + border_instance.down + 15;
	}
	if (random_side == dir.left) {
		star_x = border_instance.x - border_instance.left - 15;
		star_y = is_aiming ? soul_instance.y : irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	}
	if (random_side == dir.right) {
		star_x = border_instance.x + border_instance.right + 15;
		star_y = is_aiming ? soul_instance.y : irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	}
	
	instance_create_depth(star_x, star_y, fight_depth.bullet_outside, star_spining, {
	direction  : random_side + 180,
	image_angle : random_side + 90	
	})
	audio_play_sound_plugging(snd_projectile);
}

var period = 18 - 2 * _power;
var repeats = 20 + _power * 5;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, (repeats * period) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});