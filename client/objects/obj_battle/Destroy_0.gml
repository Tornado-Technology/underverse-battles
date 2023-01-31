instance_destroy(obj_battle_soul);
instance_destroy(obj_battle_soul_otherplayer);
statistics_set_damage(damage);
battle_border_start_animation("Destroy");

if (fight_network_mode && fight_get_initiative() == 1) {
	send_fight_finish_battle();
}
