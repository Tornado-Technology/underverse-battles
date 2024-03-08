// Arguments: bone, sides, is_aiming, custom_bone_size (optional), custom_period (optional), custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var sides_count = array_length(sides);
	var random_side = sides[fight_random_integer(0, sides_count - 1)];
	var bone_x, bone_y;
	if (random_side == dir.up) {
		bone_x = is_aiming ? soul_instance.x : fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		bone_y = border_instance.y - border_instance.up - 15;
	}
	if (random_side == dir.down) {
		bone_x = is_aiming ? soul_instance.x : fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		bone_y = border_instance.y + border_instance.down + 15;
	}
	if (random_side == dir.left) {
		bone_x = border_instance.x - border_instance.left - 15;
		bone_y = is_aiming ? soul_instance.y : fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	}
	if (random_side == dir.right) {
		bone_x = border_instance.x + border_instance.right + 15;
		bone_y = is_aiming ? soul_instance.y : fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	}
	
	var bone_size = 1;
	if (variable_instance_exists(id, "custom_bone_size")) {
		bone_size = custom_bone_size;
	}
	
	create_bone(bone_x, bone_y, bone, 2 + 0.2 * _power, bone_size, random_side + 180, random_side + 90);
	
	audio_play_sound_plugging(snd_projectile);
}

var period = 16 - _power * 2;
var repeats = 20 + _power * 5;

if (variable_instance_exists(id, "custom_period")) {
	period = custom_period;
}
if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, (repeats * period) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});