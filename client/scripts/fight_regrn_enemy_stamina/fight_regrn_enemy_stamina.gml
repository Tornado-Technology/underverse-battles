/// @param enemy_id
function fight_regrn_enemy_stamina(_enemy_id) {
	fight_add_enemy_stamina(_enemy_id, fight_get_enemy_stamina_regen(_enemy_id));
}