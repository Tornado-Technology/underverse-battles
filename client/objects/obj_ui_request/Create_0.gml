enum request_type {
	undefined = 0,
	friend = 1,
	fight = 2,
}

sprite_index = noone;
width = display_get_gui_width();
heigth = display_get_gui_height();
shift_x = 10;
shift_y = 19;

alpha = 0;

if (!variable_instance_exists(id, "request_id")) request_id = 0;
if (!variable_instance_exists(id, "username_sender")) username_sender = "*User";
if (!variable_instance_exists(id, "type")) type = request_type.undefined;

// Type
switch (type) {
	case request_type.friend:
		text = $"{username_sender} {translate_get("Request.Friend")}";
		break;
	case request_type.fight:
		text = $"{username_sender} {translate_get("Request.Fight")}";
		break;
	default:
		text = $"Unknown request from {username_sender}";
		break;
}
text_progress = 0;

// Sprite border
sprite_border = spr_ui_request;
sprite_border_width = sprite_get_width(sprite_border);
sprite_border_height = sprite_get_height(sprite_border);

// Scale
scale = max(1, (string_real_width(text, global._font_main_determination) + shift_x * 2) / sprite_get_width(sprite_border));

// Position
x = -sprite_border_width * scale;
y = sprite_border_height / 2;

// Buttons
selector = new UITextButtonSelector([translate_get("Menu.StandardButtons.Accept"), translate_get("Menu.StandardButtons.Reject")], input.left, input.right) 
	.set_padding(2)
	.set_color(c_white, c_yellow)
	.set_align(fa_center, fa_bottom)
	.set_on_press( function(self_button) {
		if (self_button.index == 0) {
			send_friend_request_accept(request_id);
		} else {
			send_friend_request_reject(request_id);
		}
		text_progress = 1;
	});

// Time Source
time_source_delay = time_source_create(time_source_game, 10, time_source_units_seconds, function() {
	text_progress = 1;
});
time_source_start(time_source_delay);