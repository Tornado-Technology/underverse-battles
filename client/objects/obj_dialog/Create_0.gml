sprite_index = spr_empty;

if (!variable_instance_exists(id, "dialog")) dialog = [];
if (!variable_instance_exists(id, "side")) side = dir.up;

pos = 0;
act = 1;
cur_text = "";
str = "";
str_num = 0;
cur_num = 0;
	
name = "";
image_type = "";
frame = noone;

skip_simb = "►";

is_showing_dialog_window = true;
dialog_window_sprite = spr_dialog_window;
dialog_window_position = new Vector2(obj_camera.view_width / 2, 5);
dialog_window_xscale = 20;
dialog_window_yscale = 5;
dialog_window_size = new Vector2(sprite_get_width(dialog_window_sprite) * dialog_window_xscale, sprite_get_height(dialog_window_sprite) * dialog_window_yscale);
shift = 184;
text_indent = 8;

death_name_function = "";

voice = snd_voice_main;
font = global._font_main_determination;
text_color = c_white;

#region Buttons

skip_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.skip)
	.set_on_press(function() {
		if (pos < string_length(cur_text)) {
			str = cur_text;
			pos = string_length(cur_text);
		}
	});
	
next_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.action)
	.set_on_press(function() {
		if (pos == string_length(cur_text)) {
			if (cur_num == str_num - 1) {
				instance_destroy();
			}
			else {
				next_dialog();
			}
		}
	});

#endregion

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

next_dialog = function() {
	cur_num++;
	event_user(2);
}

#endregion