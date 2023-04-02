event_inherited();

damage = get_char_damage(obj_character_error_sans);

hspd_inert = 0;

is_falling = false;
time_hanging = 1/6;
acceleration = 0;
hspd = 0;

get_stuck_floor = function (_scale, _acceleration) {
	audio_play_sound_plugging(snd_emergence);
	scale_const = _scale;
	scale_time = 0.1;
	acceleration = _acceleration;
	time_source = time_source_create(time_source_game, time_hanging, time_source_units_seconds, function () {
		audio_play_sound_plugging(snd_projectile);
		is_falling = true;
	});
	time_source_start(time_source);
}