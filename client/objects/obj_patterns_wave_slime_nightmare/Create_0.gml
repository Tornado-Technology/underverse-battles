callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	slime_instance = instance_create_depth(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 10, fight_depth.bullet_outside_hight, obj_slime_nightmare, {
		image_xscale: 20,
		image_yscale: 10
	});
	slime_instance.change_scale(12, 0.1);

	border_instance.wave_ane = true;
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}


update_tentacles = function () {
	var cood = [fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right), fight_random_integer(slime_instance.y - 50, slime_instance.y - 10)]
	var tentacles = instance_create_depth(cood[0], cood[1], fight_depth.border, obj_tentacles_destroy_back_nightmare, {
		image_angle: 90,	
		image_xscale: 0
	});
	tentacles.change_scale(1.3, 0.05);
}

	
bone_update = function () {
	var cood = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	
	if (irandom(1)) {	
		create_bone(cood, border_instance.y - border_instance.up, bone, 3 + _power * 0.1, 1, 270, 0);
	}
	else {	
		create_bone(cood, border_instance.y + border_instance.down, bone, 3 + _power * 0.1, 1, 90, 0);
	};
	
}

update = function() {
	bone_update();	
	
	if (_power > 0) {
		time_source_start(time_source_update_tentacles);
	};
	
}

var period = 33 - 2 * _power;
var repeats = 15 + _power * 3;
var period_tentacles = 40 - 2 * _power

time_source_update_tentacles = time_source_create(time_source_game, period_tentacles / 60, time_source_units_seconds, function () {
	update_tentacles();	
});

time_source_bone_update = time_source_create(time_source_game, 39 - 2 * _power / 60, time_source_units_seconds, function () {
	bone_update();	
});


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});