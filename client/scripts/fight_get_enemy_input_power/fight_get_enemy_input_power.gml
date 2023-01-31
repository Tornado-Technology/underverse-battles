/// @function fight_get_enemy_input_power()
/// @description Allows you to get the player's current preferences
function fight_get_enemy_input_power() {
	if (!instance_exists(obj_fight_input)) return -1;
	return obj_fight_input.selected_power;
}
