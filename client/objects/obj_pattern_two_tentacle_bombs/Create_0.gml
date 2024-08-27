// Arguments: bomb, spike, custom_repeats (optional)

callback = function() {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	speed_const = 1 + _power * 0.1;
	var _dir = 90;
	var multiplication = 1;
	var position_x = [border_instance.x - border_instance.left + 40, border_instance.x + border_instance.right - 40];
	var offset_x = 40;
	var offset_y = 30;
	var scale_const = 0.7;
	var i = 0;
	repeat (2) {
		var bomb_instnace = instance_create_depth(position_x[i], border_instance.y - border_instance.up + offset_y *  multiplication, fight_depth.bullet, bomb, {
			speed_const: speed_const,
			direction: _dir * multiplication,
			scale_const: scale_const
		});
		
		bomb_instnace.moving_up_down();
		multiplication += 2;
		i++;
	}
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var offset = fight_random_integer(-20, 20);
	var spike_instance;
	
	if (fight_random_integer(0, 1)) {
		spike_instance = instance_create_depth(border_instance.x - offset, border_instance.y - border_instance.up - 20, fight_depth.bullet_outside_hight, spike, {
			direction: 270, 
			image_angle: 270
		});
	} else {
		 spike_instance = instance_create_depth(border_instance.x - offset, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside_hight, spike, {
			direction: 90, 
			image_angle: 90
		});
	}
	spike_instance.speed_const = 2 + _power * 0.1;
	
	audio_play_sound_plugging(snd_projectile);
}

 
var period = 40 - (_power * 2);
var repeats = 6 + (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, (period) / 60, time_source_units_seconds, function() {
	update();	
}, [], repeats);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});