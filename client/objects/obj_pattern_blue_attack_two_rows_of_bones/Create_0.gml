// Arguments: bone, use_gravity_attack, custom_repeats (optional)

bone_instances = [];
bone_count = 4;

callback = function () {
	if (use_gravity_attack) {
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
		update();
		time_source_start(time_source_update);
	} else { 	
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		if(_power > 2) {
			update_bone();
			time_source_start(time_source_update_bone);
		};
		
		update_1();
		time_source_start(time_source_update_1);
	};


	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = fight_random_choose(dir.up, dir.down);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}
	
	if (use_gravity_attack) {
		var bone_scale = 1.9;
		var bone_speed = 1.1 + _power * 0.1;
		bone_instances[0] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, bone,
			bone_speed, bone_scale, 180, 180);
		bone_instances[1] = create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 15, bone,
			bone_speed, bone_scale, 0, 0);
	}
	else
	{
		var bone_scale = 4.6;
		var bone_speed = 1.8 + _power * 0.1;
		
		var bone_x = border_instance.x + border_instance.right + 10;
		var bone_y = border_instance.y - border_instance.up - 15;
		if (side == dir.down) {
			bone_x = border_instance.x - border_instance.left - 10;
			bone_y = border_instance.y + border_instance.down + 15;
		}
		
		bone_instances[0] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, bone,
			bone_speed, bone_scale, side, side);
	}
	
	character_instance.change_sprite_hand_dir(side);
}

update_1 = function () {
	var speed_bone = 2 + _power * 0.1;
	var offset = 20;
	var position_x;
	var position_y;
	if(fight_random_integer(0, 1)) {
		position_y = soul_instance.y;	
		create_bone(border_instance.x - border_instance.left - offset, position_y, bone, speed_bone, 1, 0, 90);
		create_bone(border_instance.x + border_instance.right + offset, position_y, bone, speed_bone, 1, 180, 270);
	} else {
		position_x = soul_instance.x;
		create_bone(position_x, border_instance.y - border_instance.up - offset, bone, speed_bone, 1, 270, 0);
		create_bone(position_x, border_instance.y + border_instance.down + offset, bone, speed_bone, 1, 90, 0);
	};
	
}

update_bone = function () {
	var speed_bone = 1 + _power * 0.1;
	create_bone(border_instance.x, border_instance.y - border_instance.up - 10, bone, speed_bone, 1, 270, 0);
	create_bone(border_instance.x - border_instance.left  + 20, border_instance.y + border_instance.down + 10, bone, speed_bone, 1, 90, 0);
	create_bone(border_instance.x + border_instance.right - 20, border_instance.y - border_instance.up - 10, bone, speed_bone, 1, 270, 0);
}

var period = 55 - _power * 2;
var repeats = 5 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_1 = time_source_create(time_source_game, (period / 60), time_source_units_seconds, function (){
	update_1();
}, [], repeats - 1);	

time_source_update_bone = time_source_create(time_source_game, (60 - _power * 2) / 60, time_source_units_seconds, function () {
	update_bone();	
}, [], -1);

	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();
});