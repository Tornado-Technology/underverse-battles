disable_surface = true;

be_moving_circle = false;

turn_on = false;

stage = 0;
angle = 0;
acc = 0;
image_xscale = x > obj_battle_border.x ? 1: -1; 
spwan_obj = obj_ink_bomb_ink_sans;

spwan = function () {
	var angle_offset = image_angle - 180;
	var radius = sprite_width;
	var	spwan_x = dcos(angle_offset) * radius;
	var	spwan_y = -dsin(angle_offset) * radius;

	spwan_instance = instance_create_depth(x + spwan_x, y + spwan_y, fight_depth.bullet_outside, spwan_obj, {
		speed_const: 0,
		direction:  x > obj_battle_border.x ? 180 : 0
	});
	spwan_instance.speed_const = speed_const;
}

// Time sources
time_source_move_start = time_source_create(time_source_game, 1/2, time_source_units_seconds, function () {
	audio_play_sound_plugging(snd_projectile);
	stage = 1;
});

time_source_move_next = time_source_create(time_source_game, (30 + max_acc) / 60, time_source_units_seconds, function () {
	stage = 2;
	spwan();
});

time_source_move_finish = time_source_create(time_source_game, (31 + 2 * max_acc) / 60, time_source_units_seconds, function () {
	stage = 3;

});

	time_source_start(time_source_move_start);
	time_source_start(time_source_move_next);
	time_source_start(time_source_move_finish);