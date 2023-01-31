if (instance_number(object_index) > 1) {
	instance_destroy();
}

components = instance_create_array([
	obj_setting_mobile_background,
	obj_setting_mobile_audio,
	obj_setting_mobile_description_text,
	obj_setting_mobile_elements_handler,
	obj_setting_mobile_buttons,
	obj_setting_mobile_fight_gui
]);

goto_menu = function() {
	instance_destroy();
	room_goto(room_menu);
}