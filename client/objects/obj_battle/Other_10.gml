player_index = fight_get_initiative();
var attack_id = fight_get_player_attack(player_index);
var attack_power = fight_get_player_power(player_index);

fight_get_player(1 - player_index).on_selected_attack(attack_id, player_index);

if (fight_player_using_special_action(player_index)) {
	fight_call_special_attack(player_index);
	exit;
}

fight_call_attack(player_index, attack_id, attack_power);
