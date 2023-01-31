event_inherited();
depth = fight_depth.bullet_outside_hight;
damage = get_char_damage(char_xchara_uv00);
soul_invulnerability = 20;

/* rotate */
_rotating = true;
_target_angle = -1;

/* speed */
_speed = 3.7;
_speed_rotate = 14;

/* particle system */
_use_particle = false;

alarm[0] = 30;

audio_play_sound_plugging(snd_emergence);