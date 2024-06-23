event_inherited();

depth = fight_depth.bullet_outside_hight;




stage = 0;

is_drawing = false;
speed_const = 3;
acc = 0;
image_alpha = 0;

damage = get_char_damage(obj_character_ink_sans);

audio_play_sound_plugging(snd_emergence);

// Time sources
time_source_move_start = time_source_create(time_source_game, 1/2, time_source_units_seconds, function () {
	audio_play_sound_plugging(snd_projectile);
	stage = 1;
});

time_source_move_next = time_source_create(time_source_game, (30 + max_acc) / 60, time_source_units_seconds, function () {
	stage = 2;
});

time_source_move_finish = time_source_create(time_source_game, (31 + 2 * max_acc) / 60, time_source_units_seconds, function () {
	stage = 3;
});

time_source_ink_curcle = time_source_create(time_source_game, 0.02 / dtime, time_source_units_seconds, function () {
	var ink_x = cos(degtorad(image_angle - 180))* sprite_width;
	var ink_y = -sin(degtorad(image_angle - 180))* sprite_width;
	instance_create_depth(x + ink_x + irandom_range(-2, 2), y + ink_y + irandom_range(-2, 2), fight_depth.bullet_outside, obj_ink_curcle_ink_sans);
}, [], -1);

time_source_start(time_source_move_start);
time_source_start(time_source_move_next);
time_source_start(time_source_move_finish);