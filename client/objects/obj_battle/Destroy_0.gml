instance_destroy(attack_creator); instance_destroy(obj_attack);
fight_get_player(1 - player_index).on_battle_end(damage);
statistics_set_damage(damage);
battle_border_start_animation("Destroy");
time_source_destroy(time_sourse);

if (fight_network_mode) {
	send_fight_finish_battle(initiative);
}
