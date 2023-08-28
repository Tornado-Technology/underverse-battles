// Arguments: bone, orange_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
	time_source_start(time_source_update_destroy);
}

update_0_1 = function() {
	var selected_bone = bone;
	var rand_side = irandom_range(0, 7);
	var rand_bone_type = irandom_range(0, 1);
	if (rand_bone_type == 0)
		selected_bone = orange_bone;
	var random_speed = 2 + random_range(0, _power * 0.2);
		var max_size = 8.3;
		var random_size = rand_bone_type == 0 ? max_size : random_range(3 + _power * 0.2, 6);
		if (rand_side == 0) {
			var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, selected_bone,
			random_speed, random_size, 0, 0);
		}
		if (rand_side == 1) {
			var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y - border_instance.up, selected_bone,
			random_speed, random_size, 180, 180);
		}
		if (rand_side == 2) {
			var bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y - border_instance.up, selected_bone,
			random_speed, random_size, 0, 180);
		}
		if (rand_side == 3) {
			var bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, selected_bone,
			random_speed, random_size, 180, 0);
		}
		if (rand_side == 4) {
			var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 4, selected_bone,
			random_speed, random_size, 90, 90);
		}
		if (rand_side == 5) {
			var bone_instance = create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 4, selected_bone,
			random_speed, random_size, 270, 270);
		}
		if (rand_side == 6) {
			var bone_instance = create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 4, selected_bone,
			random_speed, random_size, 90, 270);
		}
		if (rand_side == 7) {
			var bone_instance = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, selected_bone,
			random_speed, random_size, 270, 90);
		}
}

var period = 50 - _power * 5;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
var final_time = 280 + 20 * _power;
time_source_update_stop = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
});
time_source_update_destroy = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});