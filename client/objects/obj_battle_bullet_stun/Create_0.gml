event_inherited();

damage = 0;
soul_invulnerability = 1;
destructible = false;
depth = fight_depth.bullet;

on_soul_touch = function(soul) {
	if (soul.is_stunned) return;
	audio_play_sound_plugging(snd_spare_up);
	if (fight_network_mode) {
		send_fight_stun();
	}
	soul.stun();
	fight_soul_damage(damage, destructible, id);
}
