function cutscene_fight_wait_turn(turn) {
	if (global.fight_instance.turn == turn)
		return true;
	return false;
}
