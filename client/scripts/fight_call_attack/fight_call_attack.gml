/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} attack_id - index character action
/// @param {Real} attack_power - mana-dependent attack power
function fight_call_attack(player_id, attack_id, attack_power) {
	if (attack_id == -1) {
		send_fight_joined();
		return;
	}
	
	var player = fight_get_player(player_id);
	player.actions[attack_id].invoke(player, attack_power);
}
