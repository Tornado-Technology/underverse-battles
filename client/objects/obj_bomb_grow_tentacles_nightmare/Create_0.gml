event_inherited();

target_position = new Vector2(x, y);

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

image_alpha = 0;

move_up_down = false;

disable_surface = true;
depth = fight_depth.bullet_outside;

moving_up_down = function () {
	move_up_down = true;	
}

audio_play_sound_plugging(snd_emergence);