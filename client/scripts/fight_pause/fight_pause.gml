function fight_set_pause(_pause) {
	global.fight_instance.pause = _pause;
	return obj_fight.pause;
}

function fight_get_pause() {
	return global.fight_instance.pause;
}
