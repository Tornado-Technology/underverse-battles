function set_big_knife_move(instance, index, distance, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_big_knife_move(index, distance, storage_index);
	
	instance.move(distance);
	audio_play_sound_once(snd_projectile);
}