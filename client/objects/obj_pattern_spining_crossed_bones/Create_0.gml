// Arguments: rotating_bone

random_side = fight_random_integer(0, 3);

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var bone_speed = 1.5 + _power * 0.2;
	var bone_size = 6.6;
	var angle_speed = 1.2 + _power * 0.1;
	var random_y = 0;
	var random_angle = fight_random_integer(0, 90);
	
	random_side = fight_random_integer(0, 3);
	
	if (random_side == 0) {
		create_spinning_bone(border_instance.x - border_instance.left * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 0, random_angle, angle_speed);
		create_spinning_bone(border_instance.x - border_instance.left * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 0, random_angle + 90, angle_speed);
	}
	
	if (random_side == 1) {
		create_spinning_bone(border_instance.x + border_instance.right * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 180, random_angle, angle_speed);
		create_spinning_bone(border_instance.x + border_instance.right * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 180, random_angle + 90, angle_speed);
	}
	
	if (random_side == 2) {
		create_spinning_bone(border_instance.x - border_instance.left * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 0, random_angle, -angle_speed);
		create_spinning_bone(border_instance.x - border_instance.left * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 0, random_angle + 90, -angle_speed);
	}
	
	if (random_side == 3) {
		create_spinning_bone(border_instance.x + border_instance.right * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 180, random_angle, -angle_speed);
		create_spinning_bone(border_instance.x + border_instance.right * 2, border_instance.y + random_y, rotating_bone, bone_speed, bone_size, 180, random_angle + 90, -angle_speed);
	}
}

var period = 100 - _power * 4;
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});