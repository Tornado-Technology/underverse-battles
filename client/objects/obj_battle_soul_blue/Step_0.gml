event_inherited();

if (!moveable)
	exit;

switch (gravity_force) {
	case dir.up:
		event_user(4);
		break;
	case dir.down:
		event_user(1);
		break;
	case dir.left:
		event_user(2);
		break;
	case dir.right:
		event_user(3);
		break;
}

if (addit_spd == 0 && blue_attack) {
	audio_play_sound_plugging(snd_projectile_hit);
	blue_attack = false;
}
