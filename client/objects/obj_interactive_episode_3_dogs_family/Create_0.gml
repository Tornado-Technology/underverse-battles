event_inherited();

npc = obj_npc_dogs_family;

cutscenes = [
	[
		[cutscene_execute, function() { npc.interact() }],
		[cutscene_dialog, "Underverse_Episode3.DogsFamily_1", dialog_direction()],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.interact() }],
		[cutscene_dialog, "Underverse_Episode3.DogsFamily_2", dialog_direction()],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
		}]
	]
];