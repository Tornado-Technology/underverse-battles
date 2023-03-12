/// @param player_id
function fight_regrn_player_stamina(_player_id) {
	fight_add_player_stamina(_player_id, fight_get_player_stamina_regen(_player_id));
}