instance_destroy(obj_character_attack);
statistics_set_damage(damage);
battle_border_start_animation("Destroy");
time_source_destroy(time_sourse);

if (fight_network_mode && fight_get_initiative() == 1) {
	send_fight_finish_battle();
}
