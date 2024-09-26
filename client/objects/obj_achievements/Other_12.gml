/// @desc Mini-game checker

with (obj_banana_minigame_manager) {
	if (bscore >= 500) {
		achievement_give(achievement_id.potassium_overdose);
	}
}