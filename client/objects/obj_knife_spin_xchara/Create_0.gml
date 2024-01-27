event_inherited();
depth = fight_depth.bullet_outside_hight;
damage = get_char_damage(obj_character_xchara);
soul_invulnerability = 20;

/* rotate */
_rotating = true;

/* speed */
_speed = 3.7;
_speed_rotate = 14;

audio_play_sound_plugging(snd_emergence);

time_source_spin_end = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	image_angle = _target_angle;
	_rotating = false;
	audio_play_sound_plugging(snd_projectile);
});
time_source_start(time_source_spin_end);