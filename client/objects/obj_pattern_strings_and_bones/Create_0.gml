// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

	update_bone();
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_thread);
	time_source_start(time_source_update_destroy);
}

update_bone = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
	var bone_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	
	create_bone(coord[0], coord[1], bone, 1.6 + _power * 0.1, 1, bone_direction, bone_direction - 90);
}
	
update_thread = function() {
	var coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
	create_error_string(coord[0], coord[1], thread, soul_instance.x, soul_instance.y, 2.8 + _power * 0.1);
}

var period = 45;
time_source_update_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_bone();
}, [], -1);
var period = 40 - _power * 2;
time_source_update_thread = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_thread();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, 5 + _power * 0.2, time_source_units_seconds, function () {
	instance_destroy();
});