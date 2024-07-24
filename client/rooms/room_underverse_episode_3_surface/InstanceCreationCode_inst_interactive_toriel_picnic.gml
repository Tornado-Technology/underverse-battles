sides = [dir.left, dir.right];

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.Toriel", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	]
];