/// @param {Real} enemy_id
/// @param {Real} damage
function fight_enemy_hurt(enemy_id, damage) {
	var initiative = fight_get_initiative();
	var hp = fight_get_enemy_hp(enemy_id);
	
	hp = max(hp - abs(damage), 0);
	fight_set_enemy_hp(enemy_id, hp);
	fight_add_enemy_mana(initiative, damage);
	
	fight_update_death();
	
	if (fight_network_mode) {
		send_fight_damage(damage);
	}
}
