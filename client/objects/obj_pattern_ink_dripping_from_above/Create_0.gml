// Arguments:

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var x0 = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var drop_instance = choose(obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
					obj_drop_black_ink_sans, obj_drop_black_ink_sans,
					obj_drop_blue_ink_sans,
					obj_drop_green_ink_sans);
	instance_create_depth(x0, border_instance.y - border_instance.up - 5, fight_depth.bullet_outside_hight, drop_instance, {
		direction: 270,
		image_angle: direction + 90,
		use_gravity_force: false
	});
}

var period = 10 - _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});