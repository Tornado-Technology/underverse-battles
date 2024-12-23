// Arguments: max_acceleration, gasterblaster_aiming

callback = function () {
	var soul_random_position = new Vector2(fight_random_choose(border_instance.x - border_instance.left/2, border_instance.x + border_instance.right/2), fight_random_choose(border_instance.y - border_instance.up/2, border_instance.y + border_instance.down/2));
	soul_instance = create_soul(soul_random_position.x, soul_random_position.y, battle_soul_type.red);
	
	instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight, obj_ink_ball_ink_sans);

	time_source_start(time_source_update_gasterblasters);
	time_source_start(time_source_update_broomie);
	time_source_start(time_source_update_destroy);
}

update_gasterblasters = function() {
	create_aiming_gasterblaster_with_pattern(gasterblaster_aiming, soul_instance);
}

update_broomie = function () {
	var brush_side = fight_random_integer(0, 3);
	var coord_x, coord_y;
	if (brush_side == 0) {
		coord_x = border_instance.x - border_instance.left - 12;
		coord_y = border_instance.y - border_instance.up - 12;
	}
	if (brush_side == 1) {
		coord_x = border_instance.x + border_instance.right + 12;
		coord_y = border_instance.y - border_instance.up - 12;
	}
	if (brush_side == 2) {
		coord_x = border_instance.x + border_instance.right + 12;
		coord_y = border_instance.y + border_instance.down + 12;
	}
	if (brush_side == 3) {
		coord_x = border_instance.x - border_instance.left - 12;
		coord_y = border_instance.y + border_instance.down + 12;
	}
	var brush_direction = point_direction(coord_x, coord_y, soul_instance.x, soul_instance.y) + 225;
	create_broomie(coord_x, coord_y, brush, brush_direction, brush_side, 1, max_acceleration);
}

var period = 100;
var repeats = 4;
time_source_update_gasterblasters = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_gasterblasters();
}, [], repeats);
period = 80;
repeats = 5;
time_source_update_broomie = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_broomie();
}, [], repeats);
time_source_update_destroy = time_source_create(time_source_game, 9, time_source_units_seconds, function () {
	instance_destroy();
});