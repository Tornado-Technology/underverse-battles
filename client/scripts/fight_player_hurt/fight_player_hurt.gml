/// @param {Real} player_id
/// @param {Real} damage
function fight_player_hurt(player_id, damage) {
	var initiative = fight_get_initiative();
	var hp = fight_get_player_hp(player_id);
	
	damage = fight_get_player(player_id).on_taking_damage(damage);
	
	hp = max(hp - abs(damage), 0);
	fight_set_player_hp(player_id, hp);
	fight_add_player_mana(initiative, damage);
	fight_get_player(player_id).total_damage += damage;
	fight_player_add_special_action_percent_by_damage(initiative, damage);
	
	if (fight_network_mode) {
		send_fight_damage(damage);
	}
}