
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 10, battle_soul_type.blue);

	update();		
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = irandom_range(0, 2);
	var bone_speed = 1.6;
	var bone_size_up = random_range(2, 6);
	var bone_size_down = random_range(2, 6);
	var bone_up = 6.2 + bone_size_down;
	var movin_bone_up = irandom_range(5, 6) + bone_size_down;
	var  movin_bone_down = irandom_range(5, 9) + bone_size_up;
	var bone_down = 7.3 - bone_size_up;
	
	if (_power > 1) {
		bone_speed = 2.3;
	}
	
	if (_power > 3) {
		bone_speed = 2.5;
	}
			

	var speed_change = bone_speed / 12;
	
	if (side == 2) {
		var bone_0  = create_bone(border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20, changes_bone, bone_speed, bone_size_up, 180, 0);
		var bone_1 =  create_bone(border_instance.x + border_instance.right + 20, border_instance.y - border_instance.up - 20,  bone, bone_speed, bone_size_down, 180, 180);			
		bone_0.change_scale(speed_change, bone_up);
	};
	
	if (side == 1) {
		var bone_0 = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 20, changes_bone, bone_speed,  bone_down, 180, 0);
		var bone_1 = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 20, changes_bone, bone_speed, bone_up, 180, 180);
		if (irandom_range(0, 1)) {
			bone_0.change_scale(speed_change,  movin_bone_up);
			bone_1.change_scale(speed_change,  movin_bone_up);
		}
		else {
			bone_0.change_scale(speed_change,  bone_up);
			bone_1.change_scale(speed_change,  movin_bone_down);	
		};
	};
	
	if (side == 0) {
		var bone_0 = create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 20, bone, bone_speed,  bone_size_down >= 4.60 ? random_range(3.3, 3.8) : bone_size_down, 180, 0);
		var bone_1 = create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 20, changes_bone, bone_speed, bone_up, 180, 180);
		bone_1.change_scale(speed_change, bone_up);
	};
}

var period = 62 - (_power) * 2;
var repeats = 15 + _power * 3;

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});

time_source_update_start = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
