if (gameplay_underverse_episode_3_surface.frisk_was_in_ketchup_shop) instance_destroy();

required_pressing = false;

npc = obj_npc_ketchup_seller;
sans = obj_character_sans;

cutscenes = [
	[	// First meeting
		[cutscene_execute, function() {
			variable_instance_set(gameplay_underverse_episode_3_surface, "frisk_was_in_ketchup_shop", true);
			npc.speak();
		}],
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_1", dir.down],
		[cutscene_execute, npc.stop_speaking],
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_2", dir.up],
		[cutscene_execute, sans.unfollow],
		[cutscene_object_set_sprite, sans, spr_sans_walking_right],
		[cutscene_object_move_to, sans, 300, 232, 2],
		[cutscene_object_set_sprite, sans, spr_sans_standing_right],
		[cutscene_wait, 0.5],
		[cutscene_execute, function() {
			cutscene_create(cutscenes[obj_inventory.money < 12 ? 2 : 1]);
		}]
	],
	[	// Frisk has a money
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_3_Line1", dir.up],
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_4", dir.down],
		[cutscene_execute, npc.stop_speaking],
		[cutscene_execute, function() {
			if (obj_inventory.money < 20) {
				target_character.set_controlled();
				return;
			}
			cutscene_create(cutscenes[3]);
		}]
	],
	[	// Frisk has not a money
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_3_Line2", dir.up],
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_4", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			instance_destroy();
		}]
	],
	[	// Sans wants a limited edition ketchup
		[cutscene_object_set_sprite, sans, spr_sans_standing_left],
		[cutscene_dialog, "Underverse_Episode3.KetchupShop_5", dir.up],
		[cutscene_object_set_sprite, sans, spr_sans_standing_right],
		[cutscene_execute, function () {
			 target_character.set_controlled();
			 instance_destroy();
		}]
	],
];