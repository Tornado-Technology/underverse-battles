// Arguments: bone, sides, is_aiming, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var sides_count = array_length(sides);
	var random_side = sides[irandom_range(0, sides_count - 1)];
	var bone_x, bone_y;
	if (random_side == dir.up) {
		bone_x = is_aiming ? soul_instance.x : irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		bone_y = border_instance.y - border_instance.up - 15;
	}
	if (random_side == dir.down) {
		bone_x = is_aiming ? soul_instance.x : irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		bone_y = border_instance.y + border_instance.down + 15;
	}
	if (random_side == dir.left) {
		bone_x = border_instance.x - border_instance.left - 15;
		bone_y = is_aiming ? soul_instance.y : irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	}
	if (random_side == dir.right) {
		bone_x = border_instance.x + border_instance.right + 15;
		bone_y = is_aiming ? soul_instance.y : irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	}
	
	create_bone(bone_x, bone_y, bone, 2 + 0.2 * _power, 1, random_side + 180, random_side + 90);
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