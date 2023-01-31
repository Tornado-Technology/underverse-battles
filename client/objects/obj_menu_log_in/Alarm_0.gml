if (!show_loading) exit;
show_loading = false;
buttons_show = true;
display_show_message_info(translate_get("Menu.Multiplayer.FailedReconnection"), c_red);
global.failed_login = false;
menu_switch_pause(false);
