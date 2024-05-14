event_inherited();

npc = obj_npc_ficus_licker;

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.FicusLicker_1", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			variable_instance_set(gameplay_underverse_episode_3_surface, "search_event_is_started", true);
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.FicusLicker_2", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];
