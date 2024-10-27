/// @param {Asset.GMObject} obj
/// @param {String} key
/// @param {String} skin_key
/// @param {Asset.GMSprite} frame
/// @param {Bool} show
function Character(obj, key, skin_key, frame, show = true) constructor {
	object = obj;
	self.key = key;
	self.skin_key = skin_key;
	self.frame = frame;
	self.show = show;
	
	name = translate_get("Character." + key + ".Name");
	skin_name = translate_get("CharactersStyles." + skin_key);
	on_translate = undefined;
	statistics = {};
	
	static init = function() {
		var instance = instance_create(object);
		statistics = instance.get_self();
		
		on_translate = on_translate_update.connect(function() {
			name = translate_get("Character." + key + ".Name");
			skin_name = translate_get("CharactersStyles." + skin_key);
			
			var instance = instance_create(object);
			statistics = instance.get_self();
			instance_destroy(instance);
		})
		
		instance_destroy(instance);
	}
	
	static destroy = function() {
		on_translate_update.disconnect(on_translate);
	}
}

function CharacterList() {
	global.characters = [
		[
			new Character(obj_character_ink_sans, "InkSans", "Standard", spr_ink_sans_frame),
			new Character(obj_character_ink_sans_christmas, "InkSans", "Christmas", spr_ink_sans_christmas_frame),
			new Character(obj_character_ink_sans_blob, "InkSans", "Blob", spr_ink_sans_blob_frame),
			new Character(obj_character_ink_sans_galactic, "InkSans", "TON618", spr_ink_sans_galactic_frame),
			new Character(obj_character_ink_sans_ice_blood, "InkSans", "IceBlood", spr_ink_sans_ice_blood_frame),
			new Character(obj_character_ink_sans_witch, "InkSans", "Witch", spr_ink_sans_witch_frame)
		],
		[
			new Character(obj_character_error_sans, "ErrorSans", "Standard", spr_error_sans_frame),
			new Character(obj_character_error_sans_new_clothes, "ErrorSans", "NewClothes", spr_error_sans_new_clothes_frame),
			new Character(obj_character_error_sans_lord, "ErrorSans", "Lord", spr_error_sans_lord_frame),
			new Character(obj_character_error_sans_anti_piracy, "ErrorSans", "AntiPiracy", spr_error_sans_anti_piracy_frame),
			new Character(obj_character_error_sans_no_textures, "ErrorSans", "NoTextures", spr_error_sans_no_textures_frame),
			new Character(obj_character_error_sans_puppet, "ErrorSans", "Puppet", spr_error_sans_puppet_frame),
		],
		[
			new Character(obj_character_sans, "ClassicSans", "Standard", spr_sans_frame),
			new Character(obj_character_sansa_claus, "ClassicSans", "SansaClaus", spr_sansa_claus_frame),
			new Character(obj_character_sans_on_bike, "ClassicSans", "OnBike", spr_sans_on_bike_frame),
			new Character(obj_character_sans_promised, "ClassicSans", "Promised", spr_sans_promised_frame),
			new Character(obj_character_sans_child, "ClassicSans", "Child", spr_sans_child_frame),
			new Character(obj_character_sans_saness, "ClassicSans", "Saness", spr_sans_saness_frame)
		],
		[
			new Character(obj_character_fell_sans, "FellSans", "Standard", spr_fell_sans_frame),
			new Character(obj_character_fell_sans_murderer, "FellSans", "Murderer", spr_fell_sans_murderer_frame),
			new Character(obj_character_fell_sans_pumpkin_hell, "FellSans", "PumpkinHell", spr_fell_sans_pumpkin_hell_frame),
			new Character(obj_character_fell_sans_echo, "FellSans", "Echo", spr_fell_sans_echo_frame),
			new Character(obj_character_fell_sans_old_outfit, "FellSans", "OldOutfit", spr_fell_sans_old_outfit_frame),
			new Character(obj_character_fell_sans_magician, "FellSans", "Magician", spr_fell_sans_magician_frame)
		],
		[
			new Character(obj_character_swap_sans, "SwapSans", "Standard", spr_swap_sans_frame),
			new Character(obj_character_swap_sans_garland, "SwapSans", "Garland", spr_swap_sans_garland_frame),
			new Character(obj_character_swap_sans_voodoo_doll, "SwapSans", "VoodooDoll", spr_swap_sans_voodoo_doll_frame),
			new Character(obj_character_swap_sans_negative, "SwapSans", "Negative", spr_swap_sans_negative_frame),
			new Character(obj_character_swap_sans_basketbro, "SwapSans", "Basketbro", spr_swap_sans_basketbro_frame),
		],
		[
			new Character(obj_character_swap_papyrus, "SwapPapyrus", "Standard", spr_swap_papyrus_frame),
			new Character(obj_character_swap_papyrus_christmas, "SwapPapyrus", "Christmas", spr_swap_papyrus_frame_christmas),
			new Character(obj_character_swap_papyrus_changed_reality, "SwapPapyrus", "ChangedReality", spr_swap_papyrus_frame_changed_reality),
			new Character(obj_character_swap_papyrus_robber, "SwapPapyrus", "Robber", spr_swap_papyrus_robber_frame),
			new Character(obj_character_swap_papyrus_candy, "SwapPapyrus", "Candy", spr_swap_papyrus_candy_frame)
		],
		[
			new Character(obj_character_xchara, "XtaleChara", "Standard", spr_xchara_frame),
			new Character(obj_character_xchara_xmas, "XtaleChara", "Xmas", spr_xchara_frame_xmas),
			new Character(obj_character_xchara_magma, "XtaleChara", "Magma", spr_xchara_magma_frame),
			new Character(obj_character_xchara_scorpion, "XtaleChara", "Scorpion", spr_xchara_scorpion_frame),
		],
		[
			new Character(obj_character_cross, "Cross", "Standard", spr_cross_frame),
			new Character(obj_character_cross_magenta, "Cross", "Magenta", spr_cross_magenta_frame),
			new Character(obj_character_cross_detective, "Cross", "Detective", spr_cross_detective_frame),
			new Character(obj_character_cross_xevent, "Cross", "XEvent", spr_cross_xevent_frame),
			new Character(obj_character_cross_samurai, "Cross", "Samurai", spr_cross_samurai_frame)
		],
		[
			new Character(obj_character_dream, "Dream", "Standard", spr_dream_frame),
			new Character(obj_character_dream_sight_dreams, "Dream", "DreamKeeper", spr_dream_sight_dreams_frame),
		],
		[
			new Character(obj_character_nightmare, "Nightmare", "Standard", spr_nightmare_frame),
			new Character(obj_character_nightmare_ice_cream, "Nightmare", "IceCream", spr_nightmare_ice_cream_frame),
			new Character(obj_character_nightmare_mecha, "Nightmare", "Mecha", spr_nightmare_mecha_frame),
		],
		[
			new Character(obj_character_papyrus, "Papyrus", "Standard", spr_papyrus_frame),
			new Character(obj_character_papyrus_carecrow, "Papyrus", "Carecrow", spr_papyrus_carecrow_frame),
		],
		[
			new Character(obj_character_green, "Green", "Standard", spr_green_frame),
			new Character(obj_character_green_code_hacker, "Green", "CodeHacker", spr_green_code_hacker_frame),
			new Character(obj_character_green_christmas_tree, "Green", "ChristmasTree", spr_green_christmas_tree_frame),
			new Character(obj_character_green_dj, "Green", "DJ", spr_green_dj_frame),
		],
		[
			new Character(obj_character_xanastasia, "XAnastasia", "Standard", spr_xanastasia_frame),
			new Character(obj_character_xanastasia_demon, "XAnastasia", "Demon", spr_xanastasia_demon_frame)
		],
		[
			new Character(obj_character_jevil, "Jevil", "Standard", spr_jevil_frame),
			new Character(obj_character_jevil_harlequin, "Jevil", "Harlequin", spr_jevil_harlequin_frame),
		]
	];
	// Unfinished characters
	if (development_mode) {
		//array_push(global.characters, 
		//[
			
		//]);
	};
}

function init_characters() {
	var characters = global.characters;
	for (var i = 0; i < array_length(characters); i++) {
		for (var j = 0; j < array_length(characters[i]); j++) {
			characters[i, j].init();
		}
	}
}