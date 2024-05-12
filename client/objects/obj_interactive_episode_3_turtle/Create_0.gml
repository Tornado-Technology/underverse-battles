event_inherited();

npc = obj_npc_turtle;

cutscenes = [
	[
		[cutscene_execute, function() { npc.interact() }],
		[cutscene_dialog, "Underverse_Episode3.Turtle", dialog_direction()],
		[cutscene_execute, function () {
			npc.finish_interact();
			target_character.set_controlled();
		}]
	]
];