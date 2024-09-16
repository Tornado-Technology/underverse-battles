if (!variable_global_exists("__ui_fight_virtual_buttons_instance") || global.__ui_fight_virtual_buttons_instance == noone) {
	global.__ui_fight_virtual_buttons_instance = id;
	
} else {
	instance_destroy();
}

if (is_desktop && !mobile_mode) {
	instance_destroy();
	global.__ui_fight_virtual_buttons_instance = noone;
}

event_inherited();

disable = function() {
	keyboard_key_release(ord("X"));
	keyboard_key_release(vk_enter);
}

// Initilization buttons
add_button(0, "X", spr_ui_virtual_button_X, ord("X"));
add_button(1, "Action", spr_ui_virtual_button_Action, vk_enter);