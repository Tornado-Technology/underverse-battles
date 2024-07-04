sides = [dir.up];
index = 1;

cutscene_was_changed = false;
interact_callback = function() {
	target_character.set_uncontrolled();
	if (!cutscene_was_changed && variable_instance_get(gameplay_underverse_episode_3_surface, "mtt_is_late_became_known")) {
		index = 0;
		cutscene_was_changed = true;
	}
	
	cutscene_create(cutscenes[index]);
	
	if (!is_last_cutscene()) {
		index++;
	}
}

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.MTT_Shop_1", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_dialog, "Underverse_Episode3.MTT_Shop_2", dir.down],
		[cutscene_execute, function() {
			target_character.set_controlled();
		}]
	]
];