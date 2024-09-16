npc = obj_npc_mushroom_licker;

found = function() {
	gameplay_underverse_episode_3_surface.lickers_found[1] = true;
}

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.MushroomLicker_1", dir.down],
		[cutscene_execute, function() {
			found();
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.MushroomLicker_2", dir.down],
		[cutscene_execute, function() {
			found();
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
];