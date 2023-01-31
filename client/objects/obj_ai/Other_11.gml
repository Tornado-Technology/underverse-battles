///@desc select dodge
result = -1;

var i = 2;
repeat(3) {
	if (fight_get_enemy_stamina(0) > fight_get_enemy_action_stamina_cost(0, i)) {
		result = irandom_range(0, i);
		var P_hp = irandom_range(0, fight_get_enemy_max_hp(0));
		if (fight_get_enemy_action_type(0, result) == fight_action_type.healing)
			if (P_hp < fight_get_enemy_hp(0))
				result = irandom_range(0, 1);
			
		break;
	}
	i--;
	
	if (i == -1)
		result = 3;
}

fight_set_enemy_action(1, result);