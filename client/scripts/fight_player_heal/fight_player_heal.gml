/// @param {Real} player_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} value
function fight_player_heal(player_id, value) {
	var hp = fight_get_player_hp(player_id);
	var max_hp = fight_get_player_max_hp(player_id);
	
	value = abs(value);
	if (hp + value > max_hp) {
		value = max_hp - hp;
	}
	
	fight_add_player_hp(player_id, value);
	battle_remove_damage(value);
	
	fight_draw_heal_number(player_id, hp != max_hp ? value : 0);
	fight_get_player(player_id).total_heal += value;

	// Some network sync
	if (fight_network_mode) {
		send_heal_action(value);
	}
}
