///@arg {Real} player_id
///@arg {Real} action_id
function fight_get_player_action_stamina_cost(player_id, action_id){
	return fight_get_player(player_id).action_stamina_cost[action_id];
}