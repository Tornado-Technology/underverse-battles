function display_show_message_info(str, color = c_white, time_max = 160){
	obJ_constructor_ui_message_info.show_msg = true;
	obJ_constructor_ui_message_info.str = str;
	obJ_constructor_ui_message_info.color = color;
	obJ_constructor_ui_message_info.alpha = 1;
	obJ_constructor_ui_message_info.time_max = time_max;
	obJ_constructor_ui_message_info.time = 0;
}
