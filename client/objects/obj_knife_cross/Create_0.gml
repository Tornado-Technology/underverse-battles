event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_cross);
soul_invulnerability = get_char_invulnerability(obj_character_cross) ? 20 : 1;

is_spining = false;
is_moving = false;

step = 0;

direction = 0;
image_alpha = 0;
speed_angle = 0;

point_stop_x = 0;

audio_play_sound_once(snd_emergence);