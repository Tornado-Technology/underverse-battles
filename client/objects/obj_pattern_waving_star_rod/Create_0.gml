// Arguments: max_acceleration, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	repeat (_power > 2 ? 1 : 1) {
		var coord = [];
		coord = rand_side_from(border_instance.x - border_instance.left - 69, border_instance.y - border_instance.up - 69, border_instance.x + border_instance.right + 69, border_instance.y + border_instance.down + 69);
	 	 var  staff = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_glands_star_dream, {
			image_angle: point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y) + 225,
			side: -1,
			angle_speed_const: -1,
			max_acc: max_acceleration,
			target: soul_instance,
			_power: _power
		});
	}
}

var period = 80 - _power * 10;
var repeats = 6 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});