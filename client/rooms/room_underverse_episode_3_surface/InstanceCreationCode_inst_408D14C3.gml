npc = obj_npc_mint_licker;

found = function() {
	gameplay_underverse_episode_3_surface.lickers_found[2] = true;
}

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.MintLicker_1", dir.up],
		[cutscene_execute, function () {
			found();
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.MintLicker_2", dir.up],
		[cutscene_execute, function () {
			found();
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];