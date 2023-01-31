///@arg id
///@arg value
function fight_add_enemy_stamina(){
	var enemy_stamina = fight_get_enemy_stamina(argument[0]);
	var enemy_stamina_max = fight_get_enemy_max_stamina(argument[0]);
	
	enemy_stamina += argument[1];
	if (enemy_stamina_max < enemy_stamina)
		fight_set_enemy_stamina(argument[0], enemy_stamina_max);
	else
		fight_set_enemy_stamina(argument[0], enemy_stamina);
	return true;
}