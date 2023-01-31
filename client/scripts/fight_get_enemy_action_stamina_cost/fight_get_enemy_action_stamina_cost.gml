///@arg enemy_id
///@arg action_id
function fight_get_enemy_action_stamina_cost(){
	return fight_get_enemy(argument[0]).action_stamina_cost[argument[1]];
}