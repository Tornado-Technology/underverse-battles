/// @param {Real} state
function fight_set_state(_state) {
	if (global.fight_instance == noone) return;
	global.fight_instance.state = _state;
	
	fight_update_state();
}
