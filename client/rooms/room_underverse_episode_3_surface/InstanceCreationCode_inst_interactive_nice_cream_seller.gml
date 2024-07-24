npc = obj_npc_nice_cream_seller;
index = gameplay_underverse_episode_3_surface.nice_cream_saled ? 6 : (gameplay_underverse_episode_3_surface.nice_cream_seller_spook ? 5 : 0);
sides = [dir.up, dir.left];

interact_callback = function() {
	target_character.set_uncontrolled();
	cutscene_create(cutscenes[index]);
}

cutscenes = [
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_1", dir.down],
		[cutscene_execute, npc.stop_speaking],
		[cutscene_choise, "Underverse_Episode3.NiceCreamSeller_Choise", function (index) { cutscene_create(cutscenes[index == 0 ? 1 : 4]); }, dir.down]
	],
	[
		[cutscene_execute, function() {
			npc.speak();
			if (obj_inventory.remove_money(12)) {
				gameplay_underverse_episode_3_surface.nice_cream_saled = true;
				obj_inventory.add_item(new Heal(translate_get("Item.NiceCream.Name"), translate_get("Item.NiceCream.Description"), 20, 12));
				audio_play_sound_plugging(snd_purchase);
				cutscene_create(cutscenes[2]);
			} else {
				audio_play_sound_plugging(snd_cant_select);
				cutscene_create(cutscenes[3]);
			}
		}]
	],
	[
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_2", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
			index = 6;
		}],
	],
	[
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_3", dir.down],
		[cutscene_execute, function() {
			gameplay_underverse_episode_3_surface.nice_cream_seller_spook = true;
			npc.stop_speaking();
			target_character.set_controlled();
			index = 5;
		}],
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_4", dir.down],
		[cutscene_execute, function() {
			gameplay_underverse_episode_3_surface.nice_cream_seller_spook = true;
			npc.stop_speaking();
			target_character.set_controlled();
			index = 5;
		}],
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_5", dir.down],
		[cutscene_choise, "Underverse_Episode3.NiceCreamSeller_Choise", function (index) { cutscene_create(cutscenes[index == 0 ? 1 : 4]); }, dir.down]
	],
	[
		[cutscene_execute, npc.speak],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_6", dir.down],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}],
	]
];