/// @desc AI
if (fight_get_enemy_action(1) != -1) exit;
	
with(obj_ai) {
	var event_id = fight_get_initiative() == 0 ? 1 : 0;
	event_user(event_id);
}
