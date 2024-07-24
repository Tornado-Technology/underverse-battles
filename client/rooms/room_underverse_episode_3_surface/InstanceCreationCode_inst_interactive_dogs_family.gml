npc = obj_npc_dogs_family;

sides = [dir.up];

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.DogsFamily_1", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.DogsFamily_2", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];