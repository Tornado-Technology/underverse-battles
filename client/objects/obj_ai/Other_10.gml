///@desc select attack
result = -1;
result_power = -1;

var i = 2;
repeat(3) {
	if (fight_get_enemy_stamina(1) > fight_get_enemy_action_stamina_cost(1, i)) {
		result = irandom_range(0, i);
		var P_hp = irandom_range(0, fight_get_enemy_max_hp(1));
		if (fight_get_enemy_action_type(1, result) == fight_action_type.healing)
			if (P_hp < fight_get_enemy_hp(1))
				result = irandom_range(0, 1);
			
		break;
	}
	i--;
	
	if (i == -1)
		result = 3;
}

var i = max_power;
var cur_mana = fight_get_enemy_mana(1);
var P = irandom_range(0, cur_mana);
result_power = 0;
repeat(max_power) {
	var req_mana = fight_get_enemy_action_mana_cost(1, i)
	if (cur_mana >= req_mana) {
		if (P <= cur_mana - req_mana) {
			result_power = i;
			break;
		}
	}
	i--;
}

fight_set_enemy_action(1, result);
fight_set_enemy_power(1, result_power);