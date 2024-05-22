sprite_index = spr_empty;

if (!variable_instance_exists(id, "dialog")) dialog = [];
if (!variable_instance_exists(id, "side")) side = dir.up;

// Dialog window
is_showing_dialog_window = true;
dialog_window_sprite = spr_dialog_window;
dialog_window_position = new Vector2(obj_camera.view_width / 2, 5);
dialog_window_xscale = 20;
dialog_window_yscale = 5;
dialog_window_size = new Vector2(sprite_get_width(dialog_window_sprite) * dialog_window_xscale, sprite_get_height(dialog_window_sprite) * dialog_window_yscale);
shift = side == dir.down ? 180 : 0;
text_indent = 8;

voice = snd_voice_main;
font = global._font_main_determination;
text_color = c_white;
frame = spr_empty;

ui = new UIDialog(dialog)
	.set_separate(16, dialog_window_size.x - text_indent * 2)
	.set_final_action(function() {
		instance_destroy();
	})

#region Buttons

skip_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.skip)
	.set_on_press(function() {
		ui.skip_dialog();
	});
	
next_arrow = new UIImageButton(0, spr_ui_arrow)
	.set_padding(5)
	.set_bind_input(input.action)
	.set_on_press(function() {
		ui.next_dialog();
	});

#endregion

#region Methods

set_frame = function (character_name, character_emote, character_frame) {
	if (ui.name == character_name && character_emote == "") {
		frame = character_frame;
		return;
	}
	if (ui.name == character_name && ui.emotion == character_emote)
		frame = character_frame;
}

set_voice = function (character_name, character_emote, character_voice) {
	if (ui.name == character_name && character_emote == "") {
		voice = character_voice;
		return;
	}
	if (ui.name == character_name && ui.emotion == character_emote)
		voice = character_voice;
}

set_font = function (character_name, character_emote, character_font, color) {
	if (ui.name == character_name && character_emote == "") {
		font = character_font;
		text_color = color;
		return;
	}
	if (ui.name == character_name && ui.emotion == character_emote) {
		font = character_font;
		text_color = color;
	}
}

#endregion