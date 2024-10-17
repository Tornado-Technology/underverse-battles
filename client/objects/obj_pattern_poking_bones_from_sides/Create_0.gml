// Arguments: bone, sides

num = 0;

callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_number = fight_random_integer(0, array_length(sides) - 1);
	var bone_x;
	var bone_y;
	var bone_direction;
	if (sides[random_number] == dir.left) {
		bone_x = border_instance.x - border_instance.left - 55;
		bone_y = fight_random_integer(border_instance.y - border_instance.up + 5, border_instance.y + border_instance.down - 5);
		bone_direction = 0;
	}
	if (sides[random_number] == dir.right) {
		bone_x = border_instance.x + border_instance.right + 55;
		bone_y = fight_random_integer(border_instance.y - border_instance.up + 5, border_instance.y + border_instance.down - 5);
		bone_direction = 180;
	}
	if (sides[random_number] == dir.up) {
		bone_x = fight_random_integer(border_instance.x - border_instance.left + 5, border_instance.x + border_instance.right - 5);
		bone_y = border_instance.y - border_instance.up - 55;
		bone_direction = 90;
	}
	if (sides[random_number] == dir.down) {
		bone_x = fight_random_integer(border_instance.x - border_instance.left + 5, border_instance.x + border_instance.right - 5);
		bone_y = border_instance.y + border_instance.down + 55;
		bone_direction = 270;
	}
	var bone_speed = 1.2 + 0.1 * _power;
	bone_instances[num] = create_poking_bone(bone_x, bone_y, bone, bone_speed, 3.4, bone_direction);
	num++;
	audio_play_sound_plugging(snd_projectile);
}

var period = 20 - _power * 2;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
var final_time = 300 + period * 2 * _power;
time_source_update_destroy = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});