// Argument : bone, bone_spinning

platforms_speed = 0.5 + _power * 0.1;
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
	down_bone_count = 20;
	
	create_moving_platforms(border_instance.x + border_instance.right + 10, border_instance.y + 10, down_bone_count, 6, 60, -platforms_speed);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = irandom_range(0, 2);
	var bone_speed = 1.6;
	var bone_size = random_range(1.8, 3.5);
	var bone_changes_size = bone_size - random_range(6.1, 4.5);
	var bone_changes = bone_size + random_range(2.8, 3.9);
	if (_power > 1) {
		bone_speed = 2.3;
	}
	if (_power > 3) {
		bone_speed = 2.5;
	}
			
	var bone_up_size = 7.4 - bone_size;
		bone_changes = irandom_range(7.5, 8.0) - bone_changes_size;
	if (_power > 2) {
		bone_up_size = 7.8 - bone_size;
		bone_changes = irandom_range(7.8, 8.9) - bone_changes_size;
	}
		var speed_change = 0.1;
	if (side == 0 || side == 2) {
	   var bone_0 = create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 0, 0);
	   var	bone_1 = create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 20, bone, bone_speed, bone_up_size, 0, 180);
		bone_0.change_scale(speed_change, bone_changes);
		bone_1.change_scale(speed_change, bone_changes);
	}
	if (side == 1 || side == 2) {
		var bone_0 = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 180, 0);
		var bone_1 = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 20, bone, bone_speed, bone_up_size, 180, 180);
		bone_0.change_scale(speed_change, bone_changes);
		bone_1.change_scale(speed_change, bone_changes);
	}

	
}


update_platforms = function() {
	create_next_moving_platform(border_instance.x + border_instance.right + 10, border_instance.y + 10, down_bone_count, 6, 60, -platforms_speed);
}

var period = 35 - (2 + _power) * 2;
var repeate = 10 + _power * 2;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeate - 1);

time_source_update_platforms = time_source_create(time_source_game, 1 / platforms_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);
		


time_source_update_destroy = time_source_create(time_source_game, repeate * period / 60, time_source_units_seconds, function () {
	instance_destroy();
});