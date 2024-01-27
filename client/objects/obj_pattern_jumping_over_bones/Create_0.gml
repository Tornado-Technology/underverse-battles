// Arguments: bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 8, battle_soul_type.blue, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = irandom_range(0, 2);
	var bone_speed = 1.8;
	var bone_size = random_range(1.8, 3.5);
	if (_power > 1) {
		bone_speed = 2.3;
		bone_size = random_range(1.5, 2.9);
	}
	if (_power > 3) {
		bone_speed = 2.5;
		bone_size = random_range(1.3, 2.2);
	}
			
	var bone_up_size = 7.4 - bone_size;
	if (_power > 2)
		bone_up_size = 7.8 - bone_size;
			
	if (side == 0 || side == 2) {
		create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 0, 0, fight_network_mode);
		create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 20, bone, bone_speed, bone_up_size, 0, 180, fight_network_mode);
	}
	if (side == 1 || side == 2) {
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 180, 0, fight_network_mode);
		create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 20, bone, bone_speed, bone_up_size, 180, 180, fight_network_mode);
	}
}

var period = 52 - _power * 2;
var repeats = 6 + _power * 2;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});