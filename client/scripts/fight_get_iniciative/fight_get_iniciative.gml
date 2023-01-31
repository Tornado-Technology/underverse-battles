/// @return {Real}
function fight_get_initiative() {
	if (global.fight_instance == noone) return -1;
	return global.fight_instance.initiative;
}
