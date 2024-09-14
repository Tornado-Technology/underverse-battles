if (cooldown > 0) {
	cooldown -= dtime;
	is_collided = false;
	exit;
}

instance = instance_place(x, y, obj_battle_projectile);

if (instance == noone) exit;
if (instance.gave_away_magic) exit;

is_collided = true;
cooldown = cooldown_max;
instance.gave_away_magic = true;
fight_add_player_mana(initiative, mana_give);
audio_play_sound_plugging(snd_graze);
	
if (fight_network_mode) {
	send_fight_collider_soul_data();
	send_fight_mana(mana_give);
}
