event_inherited();

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.Inks_1", dialog_direction()],
		[cutscene_execute, function () { target_character.set_controlled(); }]
	],
	[
		[cutscene_dialog, "Underverse_Episode3.Inks_2", dialog_direction()],
		[cutscene_execute, function () { target_character.set_controlled(); }]
	]
];