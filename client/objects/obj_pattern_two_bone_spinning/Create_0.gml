// Arguments: bone

time = 0;
was_one_rotation_change = false;
max_chance = 4;

callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	speed_max = fight_random_integer(0, 1) ? (1.8 + _power * 0.1) : -(1.8 + _power * 0.1);
	bone_instance = [];
	var i = 0;
	var j = 0;
	var angle = 45;
	
	repeat(2) {
		var bone_x = [border_instance.x - border_instance.left - 10, border_instance.x + border_instance.right + 10];
		var bone_y = border_instance.y;
		
		var small_bone_x = border_instance.x;
		var small_bone_y = [border_instance.y - border_instance.up - 10, border_instance.y + border_instance.down + 10];
	
		repeat(2) {
			bone_instance[j++] = create_bone(bone_x[i], bone_y, bone, 0, 7.3, 0, angle);
			bone_instance[j++] = create_bone(small_bone_x, small_bone_y[i], bone, 0, 4.1, 0, angle);
			angle += 90;
		}
		
		i++;
		angle = 45;
	}
	
	time_source_start(time_source_start_moving);
	time_source_start(time_source_update_destroy);
	
	time_source_start(time_source_changes_movement);
}

time_source_changes_movement = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	time++;
	
	if (time == 1) {
		return;
	}
	if (!was_one_rotation_change && time == 4) {
		max_chance = 3;
	}
	if (!was_one_rotation_change && time >= 5) {
		max_chance = 2;
	}
	
	var random_chance = fight_random_integer(0, max_chance);
	if (random_chance < 2) {
		speed_max = -speed_max;
		was_one_rotation_change = true;
		time = 0;
	}
	
	max_chance = 4;
}, [], -1);

time_source_start_moving = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function() {
	var step = 0.03 + _power * 0.01;
	var i = 0;
	repeat(array_length(bone_instance)) {
		bone_instance[i].speed_spinning = approach(bone_instance[i].speed_spinning, speed_max, step * dtime);
		i++;
	}	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, 5 + _power, time_source_units_seconds, function () {
	instance_destroy();
});