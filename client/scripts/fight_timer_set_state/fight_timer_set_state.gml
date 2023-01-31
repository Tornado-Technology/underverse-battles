/// @param {real} state
function fight_timer_set_state(state) {
	if (!instance_exists(obj_fight_timer)) return;
	
	obj_fight_timer.state = state;
}