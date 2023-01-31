///@arg id
///@arg value
function fight_set_enemy_max_stamina(){
	fight_get_enemy(argument[0]).max_stamina=argument[1];
	return true;
}