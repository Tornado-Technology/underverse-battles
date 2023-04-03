event_inherited();
depth = fight_depth.bullet;

on_soul_touch = function(soul) {
	if (soul.is_stunned) return;
	audio_play_sound_plugging(snd_spare_up);
	if (fight_network_mode) {
		send_fight_stun();
	}
	soul.stun();
}
