/// @param {number} initiative
function fight_set_initiative(_initiative) {
	if (global.fight_instance != noone) {
		global.fight_instance.initiative = _initiative;
		return;
	}
	
	if (global.fight_network_buffer_initiative == undefined) {
		global.fight_network_buffer_initiative = _initiative;
	}
}

