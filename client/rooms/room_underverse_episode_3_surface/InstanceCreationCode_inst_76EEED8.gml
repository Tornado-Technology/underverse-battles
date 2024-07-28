npc = obj_npc_dj;

sides = [dir.up];

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog_async, "Underverse_Episode3.DJ_1", dir.down],
		[cutscene_wait_by_dialog, 2],
		[cutscene_execute, npc.stop_speaking],
		[cutscene_wait_by_dialog, 3],
		[cutscene_execute, npc.speak],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.DJ_2", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];