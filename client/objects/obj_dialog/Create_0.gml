sprite_index = spr_empty;

pos = 0;
act = 1;
cur_text = "";
str = "";
str_num = 0;
cur_num = 0;

dialog = [];
	
name = "";
image_type = "";
frame = noone;
	
restarting_dialog = true;
restarting_str_num = 0;
	
dialog_swich = 0;

shift = 184;

death_name_function = "";

voice = snd_voice_main;
font = global._font_main_determination;
text_color = c_white;

#region Methods
set_frame = function (character_name, character_emote, character_frame) {
	if (name == character_name && character_emote == "") {
		frame = character_frame;
		return;
	}
	if (name == character_name && image_type == character_emote)
		frame = character_frame;
}

set_voice = function (character_name, character_emote, character_voice) {
	if (name == character_name && character_emote == "") {
		voice = character_voice;
		return;
	}
	if (name == character_name && image_type == character_emote)
		voice = character_voice;
}

set_font = function (character_name, character_emote, character_font, color) {
	if (name == character_name && character_emote == "") {
		font = character_font;
		text_color = color;
		return;
	}
	if (name == character_name && image_type == character_emote) {
		font = character_font;
		text_color = color;
	}
}

skip_arrow = UIImageButton(spr_stat_arrow);
skip_arrow.on_press = function() {
	if (instance_exists(obj_choise)) { return; }
	keyboard_key_press(vk_enter);

	if (pos < string_length(cur_text)) {
	    keyboard_key_press(vk_shift);
	}
}
skip_arrow.on_release = function() {
	if (instance_exists(obj_choise)) { return; }

	keyboard_key_release(vk_enter);
	keyboard_key_release(vk_shift);
}
#endregion