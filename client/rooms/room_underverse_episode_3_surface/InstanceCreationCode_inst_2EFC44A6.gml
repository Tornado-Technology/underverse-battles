npc = obj_npc_burgerpants;

sides = [dir.left];

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.Burgerpants", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			variable_instance_set(gameplay_underverse_episode_3_surface, "mtt_is_late_became_known", true);
		}]
	]
];