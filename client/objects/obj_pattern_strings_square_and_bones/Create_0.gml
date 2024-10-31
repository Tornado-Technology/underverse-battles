/// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
	var random_position_x = fight_random_integer(border_instance.x - border_instance.left - 10,  border_instance.x + border_instance.right - 20);
	var random_position_y = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down - 20);
	var choose_position_x = fight_random_choose(room_width / room_width - 1, room_width);
	
	var position_x = [(random_position_x), border_instance.x - border_instance.left - 100];
	var position_y = [border_instance.y - border_instance.up - 50, random_position_y];
	var position_end_x = choose_position_x  > border_instance.x ?  border_instance.x - border_instance.left - 100 : border_instance.x + border_instance.right + 100;
	var position_end_y = position_y[1] > border_instance.y ? border_instance.y - border_instance.up - 100 : border_instance.y + border_instance.down + 100;
	var offset = 50;
	var i = 0;
	repeat(2) {
		create_error_string(choose_position_x, position_y[1] + (offset * i), thread, position_end_x,  position_y[1] + (offset * i), 3.4 + _power * 0.1);
		create_error_string(position_x[0] + (offset * i), position_y[0], thread, (border_instance.x - border_instance.left + 40) + (offset * i), border_instance.y + border_instance.down, 3.4 + _power * 0.1);
		i++;
	}
	
	update_bone();
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_destroy);
}

update_bone = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
	var bone_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	
	create_bone(coord[0], coord[1], bone, 2 + _power * 0.2, 1, bone_direction, bone_direction - 90);
}
	

var period = 45;
time_source_update_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_bone();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, 5 + _power * 0.2, time_source_units_seconds, function () {
	instance_destroy();
});