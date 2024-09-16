npc = obj_npc_harper;

sides = [dir.up, dir.left];

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Harper_1", dir.down],
		[cutscene_execute, function () {
			npc.stop_speaking();
			target_character.set_controlled();
			variable_instance_set(gameplay_underverse_episode_3_surface, "mtt_is_late_became_known", true);
		}]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Harper_2", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];