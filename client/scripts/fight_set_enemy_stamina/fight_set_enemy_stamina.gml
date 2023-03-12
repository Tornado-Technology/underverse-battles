///@arg player_id
///@arg value
function fight_set_player_stamina(player_id, value){
	fight_get_player(player_id).stamina = value;
}