///@arg id
///@arg value
function fight_set_enemy_stamina(){
	fight_get_enemy(argument[0]).stamina=argument[1];
	return true;
}