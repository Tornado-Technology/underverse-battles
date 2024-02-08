var attack_id = fight_get_player_attack(initiative);
var attack_power = fight_get_player_power(initiative);

fight_get_player(1 - initiative).on_selected_attack(attack_id, initiative);

if (fight_player_using_special_action(initiative)) {
	fight_call_special_attack(initiative);
	exit;
}

fight_call_attack(initiative, attack_id, attack_power);
