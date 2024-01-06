event_inherited();

depth = fight_depth.bullet_outside;

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;


destructible = false;
on_soul_touch = function (soul) {
	if (soul.is_stunned) return;
	audio_play_sound_plugging(snd_spare_up);
	if (fight_network_mode) {
		send_fight_stun();
	}
	soul.stun();
	fight_soul_damage(damage, destructible, id);
}

can_move = true;

image_xskew = 0;
image_yskew = 0;

x_dir = 0;
y_dir = 0;

scale_speed = 2;