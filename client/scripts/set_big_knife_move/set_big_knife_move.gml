function set_big_knife_move(instance, distance, send_object_creation = false) {
	if (send_object_creation) send_battle_object_big_knife_move(instance, distance);
	
	instance.move(distance);
	audio_play_sound_once(snd_projectile);
}