function menu_switch_pause(value){
	if (!instance_exists(obj_menu)) return;
	obj_menu.pause = value;
}

function button_reconnect() {
	network_reconnect();
	display_show_message_info(translate_get("Menu.Multiplayer.Reconnecting"), c_yellow);
	audio_play_sound_once(snd_selection);
}

function sign_up_apply() {
	if (!instance_exists(obj_menu_sign_up)) return;
	
	menu_switch_pause(true);
	
	with (obj_menu_sign_up) {
		buttons_show = false;
		show_loading = true;
		
		var password1 = inputbox_password.text;
		var password2 = inputbox_confirm_password.text;
		
		if (password1 != password2) {
			failed_registration_reason_second_password();
		} else {
			send_register(inputbox_login.text, inputbox_password.text, inputbox_email.text);
			alarm[0] = waiting_time;
		}
	}
	
	audio_play_sound_plugging(snd_selection);
}

function log_in_apply() {
	if (!instance_exists(obj_menu_log_in)) return;
	menu_switch_pause(true);
	with (obj_menu_log_in) {
		buttons_show = false;
		show_loading = true;
		send_login(inputbox_login.text, inputbox_password.text);
		alarm[0] = waiting_time;
	}
	audio_play_sound_plugging(snd_selection);
}

function menu_successful_login(menu) {
	if (network_account != undefined) {
		menu.goto_page(menu_page.multiplayer_account);
	}
}

function menu_show_user_data(value) {
	obj_menu.show_user_data = value;
}
