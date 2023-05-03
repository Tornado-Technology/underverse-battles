///@arg {Real} player_id
///@arg {Real} power_id
function fight_get_player_action_mana_cost(player_id, power_id){
	return fight_get_player(player_id).action_mana_upgrade_cost[power_id];
}