// Arguments: spike

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = irandom_range(0, 1);
	var x_rand;
	var spike_direction = 0;
	if (side == 0) {
		x_rand = border_instance.x - border_instance.left - 10;
		spike_direction = 0;
	}
	else {
		x_rand = border_instance.x + border_instance.right + 10;
		spike_direction = 180;
	}
	var y_rand = irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down - 10);
	var spike_instance = instance_create_depth(x_rand, y_rand, fight_depth.bullet_outside_hight, spike);
	spike_instance.speed_const = 2 + _power * 0.2;
	spike_instance.direction = spike_direction;
	spike_instance.image_angle = spike_direction;
	var spike_instance = instance_create_depth(x_rand, y_rand + 10, fight_depth.bullet_outside_hight, spike);
	spike_instance.speed_const = 2 + _power * 0.2;
	spike_instance.direction = spike_direction;
	spike_instance.image_angle = spike_direction;
	audio_play_sound_plugging(snd_projectile);
}

var period = 22 - _power * 3;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (340 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});