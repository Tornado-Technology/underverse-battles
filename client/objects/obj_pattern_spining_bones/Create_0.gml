// Arguments: rotating_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var bone_speed = 1.5 + _power * 0.2;
	var bone_size = 3 + _power * 0.1;
	var angle_speed = 1.5 + _power * 0.2;
	var random_side = fight_random_choose(dir.left, dir.right);
	var random_y = fight_random_integer(-50, 50);
	var random_angle = fight_random_integer(0, 90);
	if (random_side == dir.left)
		create_spinning_bone(border_instance.x - border_instance.left * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 0, random_angle, angle_speed);
	if (random_side == dir.right)
		create_spinning_bone(border_instance.x + border_instance.right * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 180, random_angle, angle_speed);
}

var period = 50 - _power * 4;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
var final_time = 300 + 30 * _power;
time_source_update_stop = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
});
time_source_update_destroy = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});