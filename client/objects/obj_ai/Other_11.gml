///@desc select dodge
var i = 2;
repeat(3) {
	if (fight_get_player_stamina(0) > fight_get_player_action_stamina_cost(0, i)) {
		fight_set_player_action(1, irandom_range(0, i));
		break;
	}
	i--;
	
	if (i == -1)
		fight_set_player_skip(1);
}