// Arguments: bone, gasterblaster, use_gravity_attack, custom_repeats (optional)

platform_speed = 1 + _power * 0.1;
offset_platform = 20;
max_position = 3;
xscale_platform = 6;
position = fight_random_integer(0, max_position - 1);
sector_y_step = 35;

callback = function() {
	soul_instance = use_gravity_attack ? create_soul(border_instance.x, border_instance.y, battle_soul_type.blue) :  create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	if(use_gravity_attack) {
		create_moving_platforms(border_instance.x - border_instance.left - 40, border_instance.y + border_instance.down - (offset_platform + 5), 5, xscale_platform, 60, platform_speed);
		create_moving_platforms(border_instance.x - border_instance.left - 40,  border_instance.y - border_instance.up + offset_platform, 5, xscale_platform, 60, platform_speed);
		
		time_source_start(time_source_update_bone);
		time_source_start(time_source_update_platforms);
	} else {
		update_bones_1();
		time_source_start(time_source_update_bone_1);
	};
	time_source_start(time_source_update_destroy);
}

update_bone = function () {
	var speed_bone = 1 + _power * 0.1;
	create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up, bone, speed_bone, 1, 0, 180);
	create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down, bone, speed_bone, 1, 0, 0);
}

update_bones_1 = function() {
	var position_x = border_instance.x - border_instance.left - 10;
	var position_y = border_instance.y - border_instance.up  + 30;
	
	create_bone(border_instance.x - border_instance.left / 2 - 10, border_instance.y - border_instance.up - 20, bone, 1 + _power * 0.2, 1, 270, 180);
	create_bone(border_instance.x, border_instance.y + border_instance.down + 20, bone, 1 + _power * 0.2, 1, 90, 0);
	create_bone(border_instance.x + border_instance.right / 2 + 10, border_instance.y - border_instance.up - 20, bone, 1 + _power * 0.2, 1, 270, 180);
	create_bone(position_x, position_y, bone, 1 + _power * 0.2, 1, 0, 270);
	create_bone(border_instance.x + border_instance.right + 10, position_y + 60, bone, 1 + _power * 0.2, 1, 180, 90);
	create_bone(position_x, position_y  + 90, bone, 1 + _power * 0.2, 1, 0, 270);
}

update = function() {
	side = fight_random_choose(dir.up, dir.down);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	};
	
	var gasterblaster_height = 54;
	var fly_time = 4 / 8;
	var charge_time = 0.4 - _power * 0.05;
	var flyout_time = 15 / 60;
	var destroy_time = 1 / 8;
	
	if (!use_gravity_attack) {
		var position_x = fight_random_choose(border_instance.x - border_instance.left - 10, border_instance.x + border_instance.right + 10);
		var position_end_x = position_x == border_instance.x - border_instance.left - 10 ? position_x / 90 : position_x + 50;
		var position_y = soul_instance.y;
		var angle = position_x == border_instance.x - border_instance.left - 10 ? 90 : 270;
	
	create_gasterblaster(gasterblaster, position_end_x, position_y, position_x, position_y, angle,  1/8, 1 - _power * 0.1, 15 / 60, 1 / 6);
		return;
	}
		
	position += fight_random_integer(1, max_position - 2);
	if (position >= max_position) {
		position -= max_position;
	}
	var border_distance = obj_camera.view_width + object_get_sprite_max_size(gasterblaster);
	var final_position_x = border_instance.x + border_instance.right + 25;
	var sector_y = border_instance.y - border_instance.up + 25;
	switch (side) {
		case dir.up:
			create_gasterblaster(gasterblaster, border_distance, sector_y, final_position_x, sector_y,  270, 1/8, 1 - _power * 0.1, 15/60, 1/6);
		break;
		
		case dir.down:
			create_gasterblaster(gasterblaster, border_distance, sector_y + sector_y_step * 2 + 30, final_position_x, sector_y + sector_y_step * 2 + 30,  270, 1/8, 1 - _power * 0.1, 15/60, 1/6);
		break;
	}	
	
	character_instance.change_sprite_hand_dir(side);		
}

update_platforms = function() {
	create_next_moving_platform(border_instance.x - border_instance.left - 40, border_instance.y + border_instance.down - (offset_platform + 5), 5, xscale_platform, 60, platform_speed);
	create_next_moving_platform(border_instance.x - border_instance.left - 40,  border_instance.y - border_instance.up + offset_platform, 5, xscale_platform, 60, platform_speed);
}

var period = 90 - _power * 2;
var repeats = 4 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

var period_update_bone_1 = 60 - _power * 5;

time_source_update_bone_1 = time_source_create(time_source_game, period_update_bone_1 / 60, time_source_units_seconds, function () {
	update_bones_1();	
}, [], -1);
	
time_source_update_bone = time_source_create(time_source_game, 1 / (6 + _power * 0.1), time_source_units_seconds, function () {
	update_bone();
}, [], -1);	
	
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_platforms = time_source_create(time_source_game, 1 / platform_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();
});