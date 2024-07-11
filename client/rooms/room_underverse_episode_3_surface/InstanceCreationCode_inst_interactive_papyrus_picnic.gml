sides = [dir.up, dir.left];

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.Papyrus", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	]
];