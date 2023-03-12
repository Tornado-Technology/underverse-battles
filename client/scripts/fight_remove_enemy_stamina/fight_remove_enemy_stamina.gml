///@arg player_id
///@arg value
function fight_remove_player_stamina(player_id, value){
	var stamina = fight_get_player_stamina(player_id);
	fight_set_player_stamina(player_id, max(0, stamina - value));
}