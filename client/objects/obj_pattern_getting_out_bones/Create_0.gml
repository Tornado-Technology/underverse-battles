// Arguments: bone

callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var coord = [];
	coord = rand_side_from(border_instance.x - border_instance.left - 40, border_instance.y - border_instance.up - 40, border_instance.x + border_instance.right + 40, border_instance.y + border_instance.down + 40);
	var bone_dir = point_direction(coord[0], coord[1], border_instance.x, border_instance.y);
	var bone_speed = 1.4 + 0.2 * _power;
	create_bone(coord[0], coord[1], bone, bone_speed, fight_random_float(2, 6), bone_dir, bone_dir - 90);
}

var period = 30 - 3 * _power;
var repeats = 10 + _power * 2;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});