// Arguments: spike

num = 7;
sum_num = num * 4;

callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
	
	x_start = border_instance.x;
	y_start = border_instance.y;
			
	var i = 0;
	repeat (sum_num) {
		// Up
		var x_spike = border_instance.x - border_instance.left + i * 10;
		var y_spike = border_instance.y - border_instance.up;
		var angle_spike = 270;
		var speed_spike = 1;
		// Right
		if (i >= num * 3) {
			x_spike = border_instance.x + border_instance.right;
			y_spike = border_instance.y - border_instance.up + (i - 3*num) * 10;
			angle_spike = 180;
		}
		// Left
		else if (i >= num * 2) {
			x_spike = border_instance.x - border_instance.left;
			y_spike = border_instance.y + border_instance.down - (i - 2*num) * 10;
			angle_spike = 0;
		}
		// Down
		else if (i >= num) {
			x_spike = border_instance.x + border_instance.right - (i - num) * 10;
			y_spike = border_instance.y + border_instance.down;
			angle_spike = 90;
		}
		
		bone_instances[i] = create_spike(x_spike, y_spike, spike, speed_spike, angle_spike, fight_network_mode);
		i++;
	}
	audio_play_sound_plugging(snd_emergence);
		
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
}

update_start = function() {
	border_instance.speed_const = 1 + _power * 0.1;
	border_instance.direction = irandom_range(0, 359);
	var i = 0;
	repeat (sum_num) {
		bone_instances[i].speed_const = border_instance.speed_const;
		bone_instances[i].direction = border_instance.direction;
		i++;
	}
}
	
update = function() {
	var shift_max = 25 + (_power * 2);
	var change_direction = false
	if (border_instance.x < x_start - shift_max || border_instance.x > x_start + shift_max) {
		border_instance.direction = 180 - border_instance.direction;
		change_direction = true;
	}
			
	if (border_instance.y < y_start - shift_max || border_instance.y > y_start + shift_max) {
		border_instance.direction = - border_instance.direction;
		change_direction = true;
	}
			
	if (change_direction) {
		var i = 0;
		repeat (sum_num) {
			bone_instances[i].direction = border_instance.direction;
			i++;
		}
	}
}

time_source_update_start = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
	update_start();
	time_source_start(time_source_update);
});
time_source_update = time_source_create(time_source_game, 1/60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + 25 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});