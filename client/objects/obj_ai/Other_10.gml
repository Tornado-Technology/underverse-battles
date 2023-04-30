///@desc select attack
result = -1;
result_power = -1;

//if (fight_check_player_special_action_readiness(1)) {
	//if (irandom_range(0, 1) < 1) {
		fight_set_player_special_action(1, true);
		exit;
	//}
//}

var i = 2;
repeat(3) {
	if (fight_get_player_stamina(1) > fight_get_player_action_stamina_cost(1, i)) {
		result = irandom_range(0, i);
		break;
	}
	i--;
	
	if (i == -1) {
		fight_set_player_skip(1);
		exit;
	}
}

var i = max_power;
var cur_mana = fight_get_player_mana(1);
var P = irandom_range(0, cur_mana);
result_power = 0;
repeat(max_power) {
	var req_mana = fight_get_player_action_mana_cost(1, i)
	if (cur_mana >= req_mana) {
		if (P <= cur_mana - req_mana) {
			result_power = i;
			break;
		}
	}
	i--;
}

fight_set_player_action(1, result);
fight_set_player_power(1, result_power);