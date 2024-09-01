// Arguments: bone, rotating_bone

callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var position_x = choose(border_instance.x - border_instance.left - 10, border_instance.x + border_instance.right + 10);
	var position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	var direction_bone = point_direction(position_x, position_y, border_instance.x, position_y);
	var bone_instance;
	var speed_bone = 3 + _power * 0.1;
	var i = 45;
	repeat(2) {
		bone_instance =	create_bone(position_x, position_y, rotating_bone, speed_bone, 2, direction_bone, i);
		bone_instance.speed_spinning = speed_bone;
		
		i += 80;	
	}
}

var period = 45 - _power * 2;
var repeats = 8 + _power * 2;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});