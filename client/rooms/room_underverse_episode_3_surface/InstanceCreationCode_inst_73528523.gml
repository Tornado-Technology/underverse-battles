npc = obj_npc_raspberries_licker;

found = function() {
	gameplay_underverse_episode_3_surface.lickers_found[0] = true;
}

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.RaspberriesLicker_1", dir.up],
		[cutscene_execute, function() {
			found();
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.RaspberriesLicker_2", dir.up],
		[cutscene_execute, function() {
			found();
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];