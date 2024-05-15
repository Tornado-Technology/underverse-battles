// Arguments: gasterblaster, gasterblaster_aiming, use_gravity_attack, is_double, custom_repeats (optional)

side = dir.left;

callback = function () {
	if (use_gravity_attack)
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
	else
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	side = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}
	
	character_instance.change_sprite_hand_dir(side);
	
	var gasterblaster_height = 54;
	var fly_time = 1/8;
	var charge_time = 0.4 - _power * 0.05;
	var flyout_time = 15/60;
	var destroy_time = 1/8;
	repeat (is_double ? 2 : 1) {
		if (!use_gravity_attack) {
			create_aiming_gasterblaster_with_pattern(gasterblaster_aiming, soul_instance, fly_time, charge_time, flyout_time, destroy_time);
			break;
		}
		
		if (side == dir.up) {
			var gasterblaster_x = obj_camera.camera_position.x - gasterblaster_height;
			var gasterblaster_y = border_instance.y - border_instance.up + 15;
			create_gasterblaster(gasterblaster, gasterblaster_x, gasterblaster_y,
				border_instance.x - border_instance.left + 60, gasterblaster_y, 90, fly_time, charge_time, flyout_time, destroy_time);
		}
		if (side == dir.down) {
			var gasterblaster_x = obj_camera.camera_position.x + obj_camera.view_width + gasterblaster_height;
			var gasterblaster_y = border_instance.y + border_instance.down - 15;
			create_gasterblaster(gasterblaster, gasterblaster_x, gasterblaster_y,
				border_instance.x + border_instance.right - 60, gasterblaster_y, 270, fly_time, charge_time, flyout_time, destroy_time);
		}
		if (side == dir.left) {
			var gasterblaster_x = border_instance.x - border_instance.left + 15;
			var gasterblaster_y = obj_camera.camera_position.y + obj_camera.view_height + gasterblaster_height;
			create_gasterblaster(gasterblaster, gasterblaster_x, gasterblaster_y,
				gasterblaster_x, border_instance.y + border_instance.down - 60, 180, fly_time, charge_time, flyout_time, destroy_time);
		}
		if (side == dir.right) {
			var gasterblaster_x = border_instance.x + border_instance.right - 15;
			var gasterblaster_y = obj_camera.camera_position.y - gasterblaster_height;
			create_gasterblaster(gasterblaster, gasterblaster_x, gasterblaster_y,
				gasterblaster_x, border_instance.y - border_instance.up + 60, 0, fly_time, charge_time, flyout_time, destroy_time);
		}
		
		if (is_double) {
			switch (side) {
				case dir.up:
					side = dir.right;
					break;
				case dir.down:
					side = dir.left;
					break;
				case dir.left:
					side = dir.up;
					break;
				case dir.right:
					side = dir.down;
					break;
			}
		}
	}
}

switch (_power) {
	case 0:
		period = 75;
		repeats = 5;
		break;
	case 1:
		period = 70;
		repeats = 6;
		break;
	case 2:
		period = 66;
		repeats = 7;
		break;
	case 3:
		period = 62;
		repeats = 8;
		break;
	case 4:
		period = 58;
		repeats = 10;
		break;
}

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}
	
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();
});