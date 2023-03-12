var player_id = fight_get_initiative();
var attack_id = fight_get_player_action(player_id);
var attack_power = fight_get_player_power(player_id);

fight_get_player(1 - player_id).on_selected_attack(attack_id, player_id);

if (fight_player_using_special_action(1)) {
	fight_call_special_attack(player_id);
	exit;
}

fight_call_attack(player_id, attack_id, attack_power);
