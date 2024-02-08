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
		try {
			statistics = instance.get_self();
		} catch(error) {
			logger.warn(error);
		}
		
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
			new Character(obj_character_ink_sans_christmas, "InkSans", "Christmas", spr_ink_sans_christmas_frame)
		],
		[
			new Character(obj_character_error_sans, "ErrorSans", "Standard", spr_error_sans_frame),
			new Character(obj_character_error_sans_new_clothes, "ErrorSans", "NewClothes", spr_error_sans_new_clothes_frame),
			new Character(obj_character_error_sans_lord, "ErrorSans", "Lord", spr_error_sans_lord_frame),
		],
		[
			new Character(obj_character_sans, "ClassicSans",	"Standard", spr_sans_frame),
			new Character(obj_character_sansa_claus, "ClassicSans", "SansaClaus", spr_sansa_claus_frame),
			new Character(obj_character_sans_on_bike, "ClassicSans", "OnBike", spr_sans_on_bike_frame),
			new Character(obj_character_sans_promised, "ClassicSans", "Promised", spr_sans_promised_frame)
		],
		[
			new Character(obj_character_fell_sans, "FellSans", "Standard", spr_fell_sans_frame),
			new Character(obj_character_fell_sans_murderer, "FellSans", "Murderer", spr_fell_sans_murderer_frame),
			new Character(obj_character_fell_sans_pumpkin_hell, "FellSans", "PumpkinHell", spr_fell_sans_pumpkin_hell_frame)
		],
		[
			new Character(obj_character_swap_sans, "SwapSans", "Standard", spr_swap_sans_frame),
			new Character(obj_character_swap_sans_garland, "SwapSans", "Garland", spr_swap_sans_garland_frame)
		],
		[
			new Character(obj_character_swap_papyrus, "SwapPapyrus", "Standard", spr_swap_papyrus_frame),
			new Character(obj_character_swap_papyrus_christmas, "SwapPapyrus", "Christmas", spr_swap_papyrus_frame_christmas),
			new Character(obj_character_swap_papyrus_changed_reality, "SwapPapyrus", "ChangedReality", spr_swap_papyrus_frame_changed_reality)
		],
		[
			new Character(obj_character_xchara, "XtaleChara", "Standard", spr_xchara_frame),
			new Character(obj_character_xchara_xmas, "XtaleChara", "Xmas", spr_xchara_frame_xmas)
		],
		[
			new Character(obj_character_cross, "Cross", "Standard", spr_cross_frame),
			new Character(obj_character_cross_xevent, "Cross", "XEvent", spr_cross_xevent_frame)
		],
		[
			new Character(obj_character_green, "Green", "Standard", spr_green_frame),
			new Character(obj_character_green_code_hacker, "Green", "CodeHacker", spr_green_code_hacker_frame),
			new Character(obj_character_green_christmas_tree, "Green", "ChristmasTree", spr_green_christmas_tree_frame)
		]
	];
}

function init_characters() {
	var characters = global.characters;
	for (var i = 0; i < array_length(characters); i++) {
		for (var j = 0; j < array_length(characters[i]); j++) {
			characters[i, j].init();
		}
	}
}