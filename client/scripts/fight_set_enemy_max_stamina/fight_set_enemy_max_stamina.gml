///@arg id
///@arg value
function fight_set_player_max_stamina(){
	fight_get_player(argument[0]).max_stamina=argument[1];
	return true;
}