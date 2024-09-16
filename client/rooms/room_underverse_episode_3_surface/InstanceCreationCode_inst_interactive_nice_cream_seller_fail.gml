npc = obj_npc_nice_cream_seller;

sides = [dir.up];

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
		[cutscene_execute, function() {
			npc.speak();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_7", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() {
			npc.speak();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_8", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];