// Arguments: max_acceleration

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var brush_side = irandom_range(0, 3);
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
	
	create_broomie(coord_x, coord_y, obj_brush_ink_sans,
		point_direction(coord_x, coord_y, soul_instance.x, soul_instance.y) + 225, brush_side, 1, max_acceleration);
}

var period = 80 - _power * 12;
var repeats = 6 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});