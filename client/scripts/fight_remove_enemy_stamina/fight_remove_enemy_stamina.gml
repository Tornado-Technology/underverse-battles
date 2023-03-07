/// @param {Real} enemy_id
/// @param {Real} amount
function fight_remove_enemy_stamina(enemy_id, amount) {
	var enemy = fight_get_enemy(enemy_id);
	enemy.stamina = max(0, enemy.stamina - abs(amount));
}
