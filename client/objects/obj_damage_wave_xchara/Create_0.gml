event_inherited();

is_destroying_outside = false;

depth = fight_depth.bullet_outside_hight;
damage = get_char_damage(obj_character_xchara);
soul_invulnerability = 20;

image_xscale = 0.7;
image_yscale = 0.7;

time_max = 3.3;

/* rotate */
_target_angle = 0;

/* speed */
speed_const = 2.5;

/* particle system */
_use_particle = true;

audio_play_sound_plugging(snd_stab);

// Particle
part_type_tail = part_type_create();
part_type_sprite(part_type_tail, spr_damage_wave, false, true, false);
part_type_scale(part_type_tail, image_xscale, image_yscale);
part_type_alpha2(part_type_tail, 1, 0);
part_type_life(part_type_tail, 20, 20);

time_source_end = time_source_create(time_source_game, time_max, time_source_units_seconds, function () {
	instance_destroy();
});
time_source_start(time_source_end);