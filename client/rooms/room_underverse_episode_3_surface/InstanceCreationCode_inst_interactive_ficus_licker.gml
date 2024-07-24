npc = obj_npc_ficus_licker;
index = gameplay_underverse_episode_3_surface.search_event_is_started ? 1 : 0;
sides = [dir.up];

founded_lickers_count = 0;

set_dialog_by_lickers_found = function() {
	founded_lickers_count = array_reduce(gameplay_underverse_episode_3_surface.lickers_found, function(accumulator, is_found) {
		return accumulator + is_found;
	}, 0);
	cutscenes[1][2] = [cutscene_dialog, $"Underverse_Episode3.FicusLicker_Found_{founded_lickers_count}", dir.down];
}

interact_callback = function() {
	target_character.set_uncontrolled();
	set_dialog_by_lickers_found();
	cutscene_create(cutscenes[index]);
	
	if (!is_last_cutscene()) {
		index++;
	}
}

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.FicusLicker_1", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			gameplay_underverse_episode_3_surface.search_event_is_started = true;
		}]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.FicusLicker_2", dir.down],
		[cutscene_dialog, "Underverse_Episode3.FicusLicker_Found_0", dir.down],
		[cutscene_execute, function() {
			if (founded_lickers_count == 3) {
				obj_inventory.money += 15;
			}
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];
