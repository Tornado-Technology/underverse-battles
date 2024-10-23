instance_destroy(obj_attack);
fight_get_player(1 - initiative).on_battle_end(damage);
statistics_set_damage(damage);
battle_border_start_animation("Destroy");
time_source_destroy(time_source);

if (fight_network_mode && fight_get_initiative() == 1) {
	send_fight_finish_battle(initiative, damage);
	fight_set_state(fight_state.reset);
}
if (!fight_network_mode) {
	fight_set_state(fight_state.reset);
}
