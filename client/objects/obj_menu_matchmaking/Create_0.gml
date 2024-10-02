player_count = 0;

title = translate_get("Menu.Multiplayer.Matchmaking");
cancel = translate_get("Menu.StandardButtons.Cancel");

show = true;

waiting_is_over = false;

if (!variable_instance_exists(id, "match_mode")) match_mode = match_type.common_1vs1;
if (!variable_instance_exists(id, "is_private")) is_private = false;

bone_loading = instance_create_depth(room_width / 2, 160, 0, obj_bone_loading, {
	match_mode: match_mode
});

press_button = function() {
	if (is_private) {
		send_private_fight_join_reject();
	} else {
		send_fight_join_reject();
	}
	
	audio_play_sound_plugging(snd_selection);
	audio_play_sound(obj_menu.menu_soundtrack_current, 2, true, 0.5);
	instance_destroy();
}

button_cancel = new UITextButton(0, cancel)
	.set_padding(5)
	.set_on_press(function() {
		press_button();
	});

disconnect_callback = on_network_connection_timeout.connect(function() {
	display_show_message_info(translate_get("Menu.Multiplayer.FailedReconnection"), c_red);
	audio_play_sound(obj_menu.menu_soundtrack_current, 2, true, 0.5);
	instance_destroy(id);
});

if (is_private) exit;

time_source_start(time_source_create(time_source_game, 6, time_source_units_seconds, function() {
	waiting_is_over = true;
}, [], 1));
