function fight_set_pause(_pause) {
	if (!instance_exists(obj_fight)) return noone;
	obj_fight.pause = _pause;
	return obj_fight.pause;
}

function fight_get_pause() {
	if (!instance_exists(obj_fight)) return noone;
	return obj_fight.pause;
}
