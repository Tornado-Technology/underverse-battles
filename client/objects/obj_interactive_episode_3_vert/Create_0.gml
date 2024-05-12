event_inherited();

npc = obj_npc_vert;

cutscenes = [
	[
		[cutscene_execute, function() { npc.interact() }],
		[cutscene_dialog, "Underverse_Episode3.Vert_1", dialog_direction],
		[cutscene_execute, function () {
			npc.finish_interact();
			finish_interact();
		}]
	],
	[
		[cutscene_execute, function() { npc.interact() }],
		[cutscene_dialog, "Underverse_Episode3.Vert_2", dialog_direction],
		[cutscene_execute, function() {
			npc.finish_interact();
			finish_interact();
		}]
	]
];