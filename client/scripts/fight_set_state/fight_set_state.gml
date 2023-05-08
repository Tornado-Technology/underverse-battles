/// @param {Real} state
function fight_set_state(_state) {
	global.fight_instance.state = _state;
	
	fight_update_state();
}
