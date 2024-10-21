event_inherited();


spr_skip = spr_ui_virtual_button_X;


disable = function() {
	keyboard_key_release(ord("X"));
	keyboard_key_release(vk_enter);
	keyboard_key_release(ord("C"));	
}

// Initilization buttons
add_button(0, "X", spr_skip, ord("X"));
add_button(1, "Action", spr_ui_virtual_button_Action, vk_enter);
	
