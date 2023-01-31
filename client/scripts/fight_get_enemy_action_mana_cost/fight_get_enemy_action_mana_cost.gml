///@arg enemy_id
///@arg power_id
function fight_get_enemy_action_mana_cost(){
	return fight_get_enemy(argument[0]).action_mana_upgrade_cost[argument[1]];
}