/// @param id
function fight_state_to_strign(_id) {
	var state_names = [];
	
	state_names[fight_state.wait]      = "Wait";
	state_names[fight_state.choosing]  = "Choosing";
	state_names[fight_state.battle]    = "Battle";
	state_names[fight_state.dodge]     = "Dodge";
	state_names[fight_state.battle]    = "Battle";
	state_names[fight_state.ending]    = "Ending";
	state_names[fight_state.undefined] = "Undefined";
	
	return string(state_names[_id]);
}