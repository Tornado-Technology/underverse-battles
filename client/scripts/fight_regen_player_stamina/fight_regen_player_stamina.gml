/// @param {Real} player_id
function fight_regen_player_stamina(player_id) {
	fight_add_player_stamina(player_id, fight_get_player_stamina_regen(player_id));
}