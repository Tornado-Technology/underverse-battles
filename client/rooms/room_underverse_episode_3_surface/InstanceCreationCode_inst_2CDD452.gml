sans = obj_character_sans;

required_pressing = false;

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
		[cutscene_character_move_to, target_character, 2526, 2851, 2],
		[cutscene_object_move_to, target_character, 2526, 2851, 0],
		[cutscene_object_set_sprite, target_character, spr_frisk_standing_right],
		[cutscene_wait, 0.5],
		[cutscene_camera_move_to, 2661  - display_get_gui_width() / 2, 2851 - display_get_gui_height() / 2, 2],
		[cutscene_wait, 0.8],
		[cutscene_dialog, "Underverse_Episode3.Dialog31", dir.down],
		[cutscene_wait, 0.8],
		[cutscene_dialog, "Underverse_Episode3.Dialog32_Line1", dir.down],
		[cutscene_wait, 0.6],
		[cutscene_dialog, "Underverse_Episode3.Dialog33", dir.down],
		[cutscene_object_set_sprite, sans, spr_sans_standing_right],
		[cutscene_wait, 0.4],
		[cutscene_object_set_sprite, sans, spr_sans_standing_left],
		[cutscene_wait, 1],
		[cutscene_dialog, "Underverse_Episode3.Dialog34", dir.down],
		[cutscene_object_set_sprite, target_character, spr_frisk_walking_right],
		[cutscene_object_move_to, target_character, 2618, 2851, 2],
		[cutscene_object_set_sprite, target_character, spr_frisk_standing_right],
		[cutscene_wait, 0.4],
		[cutscene_dialog, "Underverse_Episode3.Dialog35", dir.down],
		[cutscene_dialog, "Underverse_Episode3.Dialog36", dir.down],
	],
];