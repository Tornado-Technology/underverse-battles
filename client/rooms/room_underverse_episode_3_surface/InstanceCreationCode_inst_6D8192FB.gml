required_pressing = false;

frisk = obj_character_frisk;
sans = obj_character_sans;

interact_callback = function() {
	if (variable_instance_get(gameplay_underverse_episode_3_surface, "frisk_was_in_ketchup_shop")) {
		
		target_character.set_uncontrolled();
	
		if (gameplay_underverse_episode_3_surface.check_ketchup_in_inventory()) {
			cutscene_create(cutscenes[0]);
			return;
		}
		cutscene_create(cutscenes[1]);
	}
}

reset_characters_and_npc = function() {
	destroying_objects = [
		frisk, sans,
		obj_npc_papyrus_episode_3, obj_npc_undyne, obj_npc_alphys, obj_npc_asgore,
		obj_npc_bear, obj_npc_rabbit_mom, obj_npc_dog_smaller, obj_npc_dogs_family,
		obj_npc_royal_guard_1, obj_npc_royal_guard_2, obj_garbage_bags_pile,
		obj_npc_vulkin, obj_npc_jerry, obj_npc_mushroom_licker, obj_npc_ficus_licker,
		obj_npc_nice_cream_seller, obj_nice_cream_truck
	];
	instance_destroy_array(destroying_object);
}

cutscenes = [
	[
		[cutscene_dialog, "Underverse_Episode3.Dialog22_Line_1", dir.down],
		[cutscene_create, cutscene[2]]
	],
	[
		[cutscene_dialog, "Underverse_Episode3.Dialog22_Line_2", dir.down],
		[cutscene_create, cutscene[2]]
	],
	[
		[cutscene_execute, function() {
			var current_characters = [frisk, sans];
			
			array_foreach(current_characters, function (element) {
				if (element.x > 468 && element.x < 525 && element.y < 2827) {
					cutscene_character_move(element, 503, 2856, 1);
					element.sprite_index = element.walking_down_animation;
				}
				else if (element.x <= 468 && element.y < 2906) {
					cutscene_character_move(element, 456, 2933, 1);
					element.sprite_index = element.walking_down_animation;
				}
				else if (element.x >= 525 && element.y < 2870) {
					cutscene_character_move(element, 542, 2918, 1);
					element.sprite_index = element.walking_down_animation;
				}
				else if (element.x < 405) {
					cutscene_character_move(element, 502, 2918, 1);
					element.sprite_index = element.walking_right_animation;
				}
				else if (element.x > 600) {
					cutscene_character_move(element, 502, 2918, 1);
					element.sprite_index = element.walking_left_animation;
				}
				else {
					cutscene_character_move(element, 502, 2918, 1);
					element.sprite_index = element.walking_up_animation;
				}
			});
		}],
		[cutscene_execute, function() {
			effect_fade(2, 1, 0, c_black, true, fight_depth.ui);
		}],
		[cutscene_wait, 2],
		[cutscene_execute, function() {
			effect_blackout_start(c_black, true, fight_depth.ui);
			reset_characters_and_npc();
		}],
		[cutscene_wait, 0.5],
		[cutscene_dialog, "Underverse_Episode3.Dialog23", dir.down],
		[cutscene_execute, function() {
			effect_fade(0, 0.5, 1, c_black, true, fight_depth.ui);
			effect_blackout_end();
		}],
		[cutscene_dialog, "Underverse_Episode3.Dialog24", dir.down],
	]
];
