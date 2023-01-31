event_inherited();

heal = 0;
depth = fight_depth.bullet;

on_soul_touch = function(soul) {
	fight_enemy_heal(fight_get_next_initiative(), heal);
	instance_destroy();
	audio_play_sound_once(snd_healing, 2);
}
