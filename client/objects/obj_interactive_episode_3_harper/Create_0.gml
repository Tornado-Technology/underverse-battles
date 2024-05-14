event_inherited();

npc = obj_npc_harper;

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.Harper_1", dialog_direction],
		[cutscene_execute, function () {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.Harper_2", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			variable_instance_set(gameplay_underverse_episode_3_surface, "mtt_is_late_became_known", true);
		}]
	]
];