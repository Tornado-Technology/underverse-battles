enum character_index {
	ink_sans = 0,
	error_sans = 1,
	sans = 2,
	fell_sans = 3,
	swap_sans = 4,
	swap_papyrus = 5,
	x_chara = 6,
	cross = 7,
	green = 8,
	delta = -3
}

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
			new Character(obj_char_ink_sans, "InkSans",	"Classic", spr_ink_sans_frame)
		],
	
		[
			new Character(obj_char_error_sans, "ErrorSans",	"Classic", spr_error_sans_frame)
		],
		[
			new Character(obj_char_sans, "ClassicSans",	"Classic", spr_sans_frame),
			new Character(obj_char_sansa_claus, "ClassicSans", "SansaClaus", spr_sansa_claus_frame)
		],
		[
			new Character(obj_char_fell_sans, "FellSans", "Classic", spr_fell_sans_frame)
		],
		[
			new Character(obj_char_swap_sans, "SwapSans", "Standard", spr_swap_sans_frame)
		],
		[
			new Character(obj_char_swap_papyrus, "SwapPapyrus", "Classic", spr_swap_papyrus_frame),
			new Character(obj_char_swap_papyrus_christmas, "SwapPapyrus", "Christmas", spr_swap_papyrus_frame_christmas)
		],
		[
			new Character(obj_char_xchara_uv00, "XtaleChara", "Standard", spr_xchara_frame),
			new Character(obj_char_xchara_xmas, "XtaleChara", "Xmas", spr_xchara_frame_xmas)
		],

	];

	if (development_mode) {
		array_push(global.characters, [
			new Character(obj_char_cross_xtale, "Cross", "Standard", spr_cross_frame),
			new Character(obj_char_cross_xevent, "Cross", "XEvent", spr_cross_xevent_frame)
		]);
		
		array_push(global.characters, [
			new Character(obj_char_green, "Green", "Standard", spr_green_frame)
		]);
		
		array_push(global.characters, [
			new Character(obj_char_jevil, "Jevil", "Standard", spr_jevil_frame)
		]);
		
		array_push(global.characters, [
			new Character(obj_char_tornado, "Tornado", "Standard", spr_tornado_frame)
		]);
	}
	
	// Скины, которвые выйдут в 2.1.0
	//Character(char_error_sans_new_clothes, "ErrorSans",	"NewClothes", spr_error_sans_new_clothes_frame),
	//Character(char_error_sans_lord, "ErrorSans", "Lord", spr_error_sans_lord_frame)
}

function init_characters() {
	var characters = global.characters;
	for (var i = 0; i < array_length(characters); i++) {
		for (var j = 0; j < array_length(characters[i]); j++) {
			characters[i, j].init();
		}
	}
}