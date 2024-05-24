if (!variable_global_exists("__ui_walk_virtual_buttons_instance") || global.__ui_walk_virtual_buttons_instance == noone) {
	global.__ui_walk_virtual_buttons_instance = id;
	
} else {
	instance_destroy();
}

if (is_desktop && !mobile_mode) {
	instance_destroy();
	global.__ui_walk_virtual_buttons_instance = noone;
}

event_inherited();

is_enable_run_button = true;
is_enable_inventory_button = instance_exists(obj_inventory);

foreach_buttons = function(delegate) {
	var elements = variable_struct_get_names(buttons);
	for (var i = 0; i < array_length(elements); i++) {
		if (!is_enable_run_button && elements[i] == "X") continue;
		if (!is_enable_inventory_button && elements[i] == "SpecialAction") continue;
		delegate(buttons[$ elements[i]]);
	}
}

disable = function() {
	keyboard_key_release(vk_shift);
	keyboard_key_release(vk_enter);
	keyboard_key_release(vk_enter);
}

// Initilization buttons
add_button(0, "X", spr_ui_virtual_button_X, vk_shift);
add_button(1, "Action", spr_ui_virtual_button_Action, vk_enter);
add_button(2, "SpecialAction", spr_special_attack_ink_sans, ord("C"));