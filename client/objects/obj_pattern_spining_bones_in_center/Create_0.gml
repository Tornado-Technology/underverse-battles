// Arguments: rotating_bone

bone_instance_1 = noone;
bone_instance_2 = noone;

callback = function () {
	soul_instance = create_soul(border_instance.x - 30, border_instance.y - 30, battle_soul_type.orange);
		
	var bone_speed = 0;
	var bone_size = 8;
	var angle_speed = 1 + _power * 0.2;
	var random_number = irandom_range(0, 1);
	if (random_number == 1) angle_speed = -angle_speed;
	bone_instance_1 = create_spinning_bone(border_instance.x, border_instance.y, rotating_bone, bone_speed, 0, 0, 0, angle_speed);
	bone_instance_2 = create_spinning_bone(border_instance.x, border_instance.y, rotating_bone, bone_speed, 0, 0, 90, angle_speed);
	bone_instance_1.change_scale(bone_size, 0.2);
	bone_instance_2.change_scale(bone_size, 0.2);
	bone_instance_1.is_smooth = true;
	bone_instance_2.is_smooth = true;
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_number = irandom_range(0, 1);
	if (random_number == 0) {
		bone_instance_1.angle_speed = -bone_instance_1.angle_speed;
		bone_instance_2.angle_speed = -bone_instance_2.angle_speed;
	}
}

var period = 80 - _power * 5;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + 25 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});