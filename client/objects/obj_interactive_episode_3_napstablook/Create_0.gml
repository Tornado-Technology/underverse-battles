event_inherited();

npc = obj_npc_napstablook;

cutscenes = [
	[
		[cutscene_execute, function() { npc.interact(); }],
		[cutscene_dialog, "Underverse_Episode3.Napstablook_1", dialog_direction],
		[cutscene_execute, function () {
			npc.finish_interact();
			finish_interact();
		}]
	],
	[
		[cutscene_execute, function() { npc.interact() }],
		[cutscene_dialog_async, "Underverse_Episode3.Napstablook_2", dialog_direction],
		[cutscene_wait_by_dialog, 1],
		[cutscene_execute, function() { npc.finish_interact(); }],
		[cutscene_wait_by_dialog, 2],
		[cutscene_execute, function() { npc.interact(); }],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function () {
			npc.finish_interact();
			finish_interact();
		}]
	],
	[
		[cutscene_execute, function() { npc.interact(); }],
		[cutscene_dialog, "Underverse_Episode3.Napstablook_3", dialog_direction],
		[cutscene_execute, function () {
			npc.finish_interact();
			finish_interact();
		}]
	],
];