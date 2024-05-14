event_inherited();

npc = obj_npc_dj;

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog_async, "Underverse_Episode3.DJ_1", dialog_direction],
		[cutscene_wait_by_dialog, 2],
		[cutscene_execute, function() { npc.stop_speaking() }],
		[cutscene_wait_by_dialog, 3],
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.DJ_2", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];