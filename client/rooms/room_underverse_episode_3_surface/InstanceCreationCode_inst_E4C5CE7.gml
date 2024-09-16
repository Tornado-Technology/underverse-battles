sides = [dir.up, dir.down];

interact_callback = function() {	
	if (!gameplay_underverse_episode_3_surface.frisk_played_volleyball) exit;
		
	target_character.set_uncontrolled();
	cutscene_create(cutscenes[index]);
	
	if (!is_last_cutscene()) {
		index++;
	}
}

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.Alphys_2", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_dialog, "Underverse_Episode3.Alphys_3", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	]
];