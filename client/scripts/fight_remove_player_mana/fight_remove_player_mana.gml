/// @param {Real} player_id
/// @param {Real} value
function fight_remove_player_mana(player_id, value) {
	var mana = fight_get_player_mana(player_id);
	fight_set_player_mana(player_id, max(0, mana - value));
}