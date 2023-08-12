// Arguments: spining_bone

callback = function () {
	soul_instance = create_soul(_border.x, _border.y + _border.down - 8, battle_soul_type.blue);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_x = irandom_range(-_border.left, _border.right);
	var bone_instance = instance_create_depth(_border.x + random_x, _border.y - _border.up - 10, fight_depth.bullet_outside, spining_bone);
	bone_instance.speed_const = 3 + _power * 0.1;
	bone_instance.direction_const = point_direction(bone_instance.x, bone_instance.y, soul_instance.x, soul_instance.y);
	audio_play_sound_plugging(snd_projectile);
}

var period = 33 - 3 * _power;
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