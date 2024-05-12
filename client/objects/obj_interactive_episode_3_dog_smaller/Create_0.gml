event_inherited();

npc = obj_npc_dog_smaller;

cutscenes = [
	[
		[cutscene_execute, npc.interact()],
		[cutscene_dialog, "Underverse_Episode3.DogSmaller_1", dialog_direction],
		[cutscene_execute, function() {
			npc.finish_interact();
			finish_interact();
		}]
	],
	[
		[cutscene_execute, npc.interact()],
		[cutscene_dialog, "Underverse_Episode3.DogSmaller_2", dialog_direction],
		[cutscene_execute, function() {
			npc.finish_interact();
			finish_interact();
		}]
	]
];