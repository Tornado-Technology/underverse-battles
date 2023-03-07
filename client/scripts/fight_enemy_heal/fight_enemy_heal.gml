/// @param {Real} enemy_id - index character in obj_fight, for default (0 - Player, 1 - AI or Opponent)
/// @param {Real} value
function fight_enemy_heal(enemy_id, value) {
	var hp = fight_get_enemy_hp(enemy_id);
	var max_hp = fight_get_enemy_max_hp(enemy_id);
	
	value = abs(value);
	if (hp + value > max_hp) {
		value = max_hp - hp;
	}
	
	fight_add_enemy_hp(enemy_id, value);
	battle_remove_damage(value);
	fight_update_death();
	fight_get_enemy(enemy_id).total_heal += value;
	fight_draw_heal_number(enemy_id, hp != max_hp ? value : 0);

	// Some network sync
	if (fight_network_mode) {
		send_heal_action(value);
	}
}
