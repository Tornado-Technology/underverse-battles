event_inherited();

npc = obj_npc_mushroom_licker;

is_found = false;

interact_callback = function() {
	target_character.set_uncontrolled();
	
	if (variable_instance_get(gameplay_underverse_episode_3_surface, "search_event_is_started") && !is_found) {
		cutscene_create(cutscenes[1]);
		is_found = true;	
	}
	else {
		cutscene_create(cutscenes[index]);
	}
}

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.MushroomLicker_1", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			index = 2;
		}]
	],
	[
		[cutscene_dialog, "Underverse_Episode3.MushroomLicker_2", dialog_direction],
		[cutscene_wait_by_dialog, 1],
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			index = 2;
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.MushroomLicker_3", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
];