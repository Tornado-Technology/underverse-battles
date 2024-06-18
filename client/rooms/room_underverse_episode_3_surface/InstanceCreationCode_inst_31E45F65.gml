npc = obj_npc_bear;

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Bear_1", dir.up],
		[cutscene_execute, npc.stop_speaking],
		[cutscene_execute, target_character.set_controlled]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Bear_2", dir.up],
		[cutscene_execute, npc.stop_speaking],
		[cutscene_execute, target_character.set_controlled]
	]
];