///@arg id
///@arg value
function fight_add_player_stamina(){
	var player_stamina = fight_get_player_stamina(argument[0]);
	var player_stamina_max = fight_get_player_max_stamina(argument[0]);
	
	player_stamina += argument[1];
	if (player_stamina_max < player_stamina)
		fight_set_player_stamina(argument[0], player_stamina_max);
	else
		fight_set_player_stamina(argument[0], player_stamina);
	return true;
}