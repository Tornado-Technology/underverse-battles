event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = 6;
soul_invulnerability = 20;

speed_count = 0;
stage = 0;

step = 0.5;

time_destory = 40;
radius = 10;
impact_on_radius = function () {}

destroying = false;

audio_play_sound_plugging(snd_projectile);


time_source_shot = time_source_create(time_source_game, 10 / 60, time_source_units_seconds, function () {
	move = stages_move.target_place;
});

time_source_obj_destroy = time_source_create(time_source_game, time_destory / 60, time_source_units_seconds, function () {
	destroying = true;
});
