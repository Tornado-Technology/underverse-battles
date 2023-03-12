event_inherited();
depth = fight_depth.bullet_outside_hight;
damage = get_char_damage(obj_character_xchara);
soul_invulnerability = 20;

/* size */
image_xscale = 0.7;
image_yscale = 0.7;

/* time */
time = 0;
time_max = 200;

/* rotate */
_target_angle = 0;

/* speed */
_speed = 2.5;

/* particle system */
_use_particle = true;

audio_play_sound_plugging(snd_stab);