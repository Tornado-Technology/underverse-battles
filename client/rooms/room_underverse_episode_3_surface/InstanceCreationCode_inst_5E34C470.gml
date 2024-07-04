sides = [dir.down, dir.up];

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.Alphys", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	]
];