event_inherited();

npc = obj_npc_doggo;

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.Doggo_1", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.Doggo_2", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];