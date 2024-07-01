enum request_type {
	undefined = 0,
	friend = 1,
	fight = 2,
}

sprite_index = noone;
width = display_get_gui_width();
heigth = display_get_gui_height();

alpha = 0;

if (!variable_instance_exists(id, "request_id")) instance_destroy();
if (!variable_instance_exists(id, "username_sender")) username_sender = "*User";
if (!variable_instance_exists(id, "type")) type = request_type.undefined;

// Type
switch (type) {
	case request_type.friend:
		text = $"{translate_get("Request.Friend")} {username_sender}";
		break;
	case request_type.fight:
		text = $"{translate_get("Request.Fight")} {username_sender}";
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

// Position
x = -sprite_border_width;
y = sprite_border_height / 2;

// Scale
scale = max(1, string_length($"{text} {username_sender}") * 8 / 110);

// Buttons
button_accept = UITextButton(translate_get("Menu.StandardButtons.Accept"), function() {
	send_friend_request_accept(request_id);
	text_progress = 1;
});
button_reject = UITextButton(translate_get("Menu.StandardButtons.Reject"), function() {
	send_friend_request_reject(request_id);
	text_progress = 1;
});

// Time Source
time_source_delay = time_source_create(time_source_game, 10, time_source_units_seconds, function() {
	text_progress = 1;
});
time_source_start(time_source_delay);