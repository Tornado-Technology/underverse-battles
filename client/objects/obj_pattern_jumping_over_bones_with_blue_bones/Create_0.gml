// Arguments: bone, blue_bone

side = 0;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 8, battle_soul_type.blue);
		
	update_blue();
	time_source_start(time_source_update_blue);
	time_source_start(time_source_update_destroy);
}

update = function() {
	if (side == 0) {
		create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 0, 0);
		create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 20, bone, bone_speed, bone_up_size, 0, 180);
	}
	if (side == 1) {
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 180, 0);
		create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 20, bone, bone_speed, bone_up_size, 180, 180);
	}
}

update_blue = function() {
	side = irandom_range(0, 1);
	bone_speed = 1.5;
	bone_size = random_range(1.6, 3);
	if (_power > 1) {
		bone_speed = 2;
		bone_size = random_range(1.5, 2.7);
	}
	if (_power > 3) {
		bone_speed = 2.2;
		bone_size = random_range(1.3, 2.2);
	}
			
	bone_up_size = 7.4 - bone_size;
	if (_power > 2) {
		bone_up_size = 7.8 - bone_size;
	}
	
	if (side == 0) {
		create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 20, blue_bone, bone_speed, bone_up_size, 0, 0);
	}
	if (side == 1) {
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 20, blue_bone, bone_speed, bone_up_size, 180, 0);
	}
}

var period = 78 - _power * 2;
var repeats = 6 + _power * 2;
time_source_update_blue = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_blue();
	time_source_start(time_source_update);
}, [], repeats - 1);

time_source_update = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	update();
});

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});