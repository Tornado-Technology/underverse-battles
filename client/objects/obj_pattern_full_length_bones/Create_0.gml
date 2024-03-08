// Arguments: bone

bone_size = 8.3;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var rand_side = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	var bone_speed = 2 + _power * 0.2;
	if (rand_side == dir.left) {
		var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, bone,
		bone_speed, bone_size, 0, 0);
	}
	else if (rand_side == dir.right) {
		var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, bone,
		bone_speed, bone_size, 180, 0);
	}
	else if (rand_side == dir.down) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 4, bone,
		bone_speed, bone_size, 90, 90);
	}
	else if (rand_side == dir.up) {
		var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, bone,
		bone_speed, bone_size, 270, 90);
	}
}

var period = 50 - _power * 5;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
var final_time = 240 + 20 * _power;
time_source_update_stop = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});