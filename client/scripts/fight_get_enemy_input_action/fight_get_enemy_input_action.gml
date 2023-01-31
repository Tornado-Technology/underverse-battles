/// @function fight_get_enemy_input_action()
/// @description Allows you to get the player's current preferences
function fight_get_enemy_input_action() {
	if (!instance_exists(obj_fight_input)) return -1;
	return obj_fight_input.selected_action;
}