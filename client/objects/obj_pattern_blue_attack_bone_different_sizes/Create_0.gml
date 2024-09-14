// Arguments: bone, use_gravity_attack, custom_repeats (optional)

platform_speed = 1 + _power * 0.1;
offset_platform = 20;
max_position = 3;
xscale_platform = 6;
position = fight_random_integer(0, max_position - 1);
sector_y_step = 35;

callback = function() {
	speed_bone = 1 + _power * 0.1;
	soul_instance = use_gravity_attack ? create_soul(border_instance.x, border_instance.y, battle_soul_type.blue) :  create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	var position_x = border_instance.x - border_instance.left;
	var position_down_x = border_instance.x + border_instance.right; 
	
	create_bone(position_x, border_instance.y - border_instance.up, bone, speed_bone, 1, 0, 180);
	create_bone(position_down_x, border_instance.y + border_instance.down, bone, speed_bone, 1, 0, 0);

	if (use_gravity_attack) {
		create_moving_platforms(border_instance.x - border_instance.left - 40, border_instance.y + border_instance.down - (offset_platform + 5), 5, xscale_platform, 60, platform_speed);
		create_moving_platforms(border_instance.x - border_instance.left - 40,  border_instance.y - border_instance.up + offset_platform, 5, xscale_platform, 60, platform_speed);
		time_source_start(time_source_update_platforms);
	} else {
		speed_bone = 2 + _power * 0.1;	
	}
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_destroy);
}

update_bone = function() {
	var bone_above_scale = 1;
	var bone_below_scale = 1;
	var can_scale = fight_random_float(2, 2.3);
	var chance = fight_random_integer(1, 100) <= 20;
	if (!use_gravity_attack) {
		chance = fight_random_integer(1, 100) <= (70 +  5 * _power);
		can_scale = fight_random_float(2, 3 + _power * 0.1);
	}
	
	if (chance) {
		if(side == dir.up) {
			bone_above_scale = can_scale;
		} else {
			bone_below_scale = can_scale;
		}
	}
	
	create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up, bone, speed_bone, bone_above_scale, 0, 180);
	create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down, bone, speed_bone, bone_below_scale, 0, 0);
}

update = function() {
	side = fight_random_choose(dir.up, dir.down);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}

	character_instance.change_sprite_hand_dir(side);		
}

update_platforms = function() {
	create_next_moving_platform(border_instance.x - border_instance.left - 40, border_instance.y + border_instance.down - (offset_platform + 5), 5, xscale_platform, 60, platform_speed);
	create_next_moving_platform(border_instance.x - border_instance.left - 40,  border_instance.y - border_instance.up + offset_platform, 5, xscale_platform, 60, platform_speed);
}

var period = 80 - _power * 2;
var repeats = 4 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}
	
time_source_update_bone = time_source_create(time_source_game, 1 / (6 + _power * 0.1), time_source_units_seconds, function() {
	update_bone();
}, [], -1);
	
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], repeats - 1);

time_source_update_platforms = time_source_create(time_source_game, 1 / platform_speed, time_source_units_seconds, function() {
	update_platforms();
}, [], -1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function() {
	character_instance.stop_hand_wave();
	instance_destroy();
});