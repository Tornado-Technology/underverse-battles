event_inherited();

npc = obj_npc_turtle;

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.Turtle", dialog_direction],
		[cutscene_execute, function () {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];