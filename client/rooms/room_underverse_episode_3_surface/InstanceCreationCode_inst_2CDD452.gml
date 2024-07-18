sans = obj_character_sans;
ink_sans = obj_character_ink_sans;

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
	[	// Found Sans (index: 0)
		[cutscene_execute, function() {
			var angle = point_direction(target_character.x, target_character.y, 2526, 2851);
			if (angle > 45 && angle < 90) {
				target_character.sprite_index = spr_frisk_walking_up;
				return;
			}
			if (angle < 315 && angle > 270) {
				target_character.sprite_index = spr_frisk_walking_down;
				return;
			}
			target_character.sprite_index = spr_frisk_walking_right;
		}],
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
		[cutscene_execute, function() {
			instance_create_depth(2697, 2851, fight_depth.player, ink_sans, {
				sprite_index: spr_ink_sans_standing_left
			});
		}],
		[cutscene_wait, 2],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_standing_left_awkward],
		[cutscene_dialog_async, "Underverse_Episode3.Dialog36", dir.down],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprite, sans, spr_sans_standing_right],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_standing_left],
		[cutscene_wait_dialog_end],
		[cutscene_character_move_to, target_character, 2624, 2851, 2],
		[cutscene_object_set_sprite, sans, spr_sans_walking_down],
		[cutscene_object_move_to, sans, 2661, 2843, 1],
		[cutscene_object_set_sprite, sans, spr_sans_standing_down],
		[cutscene_wait, 0.5],
		[cutscene_dialog_async, "Underverse_Episode3.Dialog37", dir.down],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_spreaded_hands],
		[cutscene_wait_by_dialog, 3],
		[cutscene_object_set_sprite, sans, spr_sans_standing_left],
		[cutscene_wait_by_dialog, 4],
		[cutscene_object_set_sprite, sans, spr_sans_standing_down],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 2],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_standing_left],
		[cutscene_dialog, "Underverse_Episode3.Dialog38", dir.down],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_walking_right],
		[cutscene_character_move, ink_sans, 140, 0, 1],
		[effect_fade, 2, 1, 2, c_white],
		[cutscene_wait, 2],
		[audio_play_soundtrack, snd_omen, false],
		[cutscene_object_set_position, sans, 2661, 2851],
		[cutscene_object_set_sprite, sans, spr_sans_standing_left],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_sitting_drawing],
		[cutscene_wait, 3],
		[cutscene_dialog_async, "Underverse_Episode3.Dialog39", dir.down],
		[cutscene_wait_by_dialog, 4],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_sitting_drawing_looking_up],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_sitting_drawing],
		[cutscene_wait, 1.5],
		[cutscene_execute, function() {
			cutscene_create(obj_inventory.ui.item_count > 1 ? cutscenes[1] : cutscenes[4]);
		}],
	],
	[	// Open inventory (index: 1)
		[cutscene_dialog, "Underverse_Episode3.Dialog40", dir.down],
		[cutscene_execute, function() {
			obj_inventory.set_cutscene_inventory(function() {
				if (obj_inventory.check_used("KetchupLimited")) {
					cutscene_create(cutscenes[3]);
					return;
				}
				cutscene_create(cutscenes[2]);
			});
		}]
	],
	[	// Chose something (index: 2)
		[cutscene_wait, 1],
		[cutscene_dialog, "Underverse_Episode3.Dialog41_Line1", dir.down],
		[cutscene_execute, function() {
			cutscene_create(cutscenes[4]);
		}],
	],
	[	// Chose limited edition ketchup (index: 3)
		[cutscene_wait, 0.5],
		[cutscene_dialog, "Underverse_Episode3.Dialog41_Line2", dir.down],
		[cutscene_execute, function() {
			cutscene_create(cutscenes[4]);
		}],
	],
	[	// Chose limited edition ketchup (index: 4)
		[cutscene_wait, 2],
		[cutscene_dialog, "Underverse_Episode3.Dialog42", dir.down],
		[cutscene_object_set_sprite, target_character, spr_frisk_walking_right],
		[cutscene_object_move_to, target_character, 2654, 2851, 1],
		[cutscene_object_set_sprite, target_character, spr_frisk_hugs_sans_start],
		[cutscene_object_set_sprite, sans, spr_empty],
		[cutscene_wait, 3],
		[cutscene_dialog, "Underverse_Episode3.Dialog43", dir.down],
		[cutscene_object_set_sprite, target_character, spr_frisk_hugs_sans_end],
		[cutscene_wait, 0.4],
		[cutscene_object_set_sprite, sans, spr_sans_got_heart_locket],
		[cutscene_object_set_sprite, target_character, spr_frisk_walking_right],
		[cutscene_object_move_to, target_character, 2624, 2851, 1],
		[cutscene_object_set_sprite, target_character, spr_frisk_standing_right],
		[cutscene_wait, 1.5],
		[cutscene_dialog_async, "Underverse_Episode3.Dialog44", dir.down],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprite, sans, spr_sans_got_heart_locket_closing_eyes],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_standing_right],
		[cutscene_object_set_sprite, sans, spr_sans_walking_right_heart_locket],
		[cutscene_object_move_to, sans, 2801, 2851, 2],
		[cutscene_object_set_sprite, sans, spr_sans_standing_right_heart_locket],
		[cutscene_wait, 0.5],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_standing_left],
		[cutscene_wait, 1.5],
		[cutscene_object_set_sprite, ink_sans, spr_ink_sans_walking_right],
		[cutscene_character_move, ink_sans, 200, 0, 2],
		[cutscene_wait, 2],
		[cutscene_object_set_sprite, sans, spr_sans_standing_left_heart_locket],
		[cutscene_wait, 2],
		[cutscene_object_set_sprite, sans, spr_sans_walking_right_heart_locket],
		[cutscene_character_move, sans, 200, 0, 2],
		[cutscene_wait, 1],
		[effect_fade, 3, 1, 0, c_black],
		[audio_sound_gain, snd_omen, 0, 2000],
		[audio_sound_gain, snd_park, 0, 2000],
		[cutscene_wait, 3],
		[room_goto, room_menu]
	],
];