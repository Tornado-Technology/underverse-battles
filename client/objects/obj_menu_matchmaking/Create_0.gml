title = translate_get("Menu.Multiplayer.Matchmaking");
cancel = translate_get("Menu.StandardButtons.Cancel");

show = true;

bone_loading = instance_create_depth(room_width / 2, 150, 0, obj_bone_loading);

waiting_is_over = false;

press_button = function() {
	send_fight_join_reject();
	audio_play_sound_plugging(snd_selection);
	audio_play_sound(obj_menu.menu_soundtrack_current, 2, true, 0.5);
	instance_destroy();
}

button_cancel = UITextButton(cancel, function() {
	press_button();
})

time_source_start(time_source_create(time_source_game, 3, time_source_units_seconds, function() {
	waiting_is_over = true;
}, [], 1));
