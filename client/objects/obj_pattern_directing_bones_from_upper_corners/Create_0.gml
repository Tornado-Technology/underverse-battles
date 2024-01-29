// Arguments: spining_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 8, battle_soul_type.blue);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_x = irandom_range(-border_instance.left, border_instance.right);
	var angle_speed = 5;
	create_spinning_bone(border_instance.x + random_x, border_instance.y - border_instance.up - 10, spining_bone,
		3 + _power * 0.1, 1, point_direction(bone_instance.x, bone_instance.y, soul_instance.x, soul_instance.y), 0, angle_speed);
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