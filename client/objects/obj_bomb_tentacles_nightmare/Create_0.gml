event_inherited();

depth = fight_depth.bullet_outside;

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

has_spawned = false;
is_destroying = false;

bomb_idle_sprite = sprite_index;
bomb_growing_sprite = spr_bomb_growing_fast_nightmare;

spwan = function () {
	has_spawned = true;
	sprite_index = bomb_growing_sprite;
	audio_play_sound_plugging(snd_spare_up);
}

audio_play_sound_plugging(snd_emergence);