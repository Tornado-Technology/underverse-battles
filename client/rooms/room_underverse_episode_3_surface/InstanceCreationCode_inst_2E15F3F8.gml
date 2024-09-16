npc = obj_npc_vert;

sides = [dir.up, dir.right];

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Vert_1", dir.up],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}],
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Vert_2", dir.up],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}],
	]
];