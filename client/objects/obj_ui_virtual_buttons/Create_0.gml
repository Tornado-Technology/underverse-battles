if (!variable_global_exists("__ui_virtual_buttons_instance") || global.__ui_virtual_buttons_instance == noone) {
	global.__ui_virtual_buttons_instance = id;
	
} else {
	instance_destroy();
}

if (is_desktop && !mobile_mode) {
	instance_destroy();
	global.__ui_virtual_buttons_instance = noone;
}

is_enable = false;
buttons = {};

get_button = function(name) {
	if (variable_struct_get(buttons, name)) return buttons[$ name];
}

add_button = function(name, sprite, key, is_customizable = true) {
	if (!variable_struct_get(buttons, name)) {
		buttons[$ name] = {
			is_customizable: is_customizable,
			name: name,
			position_x: data_get("Settings.MobileControls.Buttons." + name + ".Position.X"),
			position_y: data_get("Settings.MobileControls.Buttons." + name + ".Position.Y"),
			scale: data_get("Settings.MobileControls.Buttons." + name + ".Scale"),
			instance: VirtualKey(sprite, key),
		}
	}
}

foreach_buttons = function(delegate) {
	var elements = variable_struct_get_names(buttons);
	for (var i = 0; i < array_length(elements); i++) {
		delegate(buttons[$ elements[i]]);
	}
}


array = [];
get_customizable_buttons = function() {
	array = [];
	
	foreach_buttons(function(button) {
		if (!button.is_customizable) return;
		
		array_push(array, button);
	});
	
	return array;
}

// Initilization buttons
add_button("X", spr_ui_virtual_button_X, ord("X"));
add_button("Action", spr_ui_virtual_button_Action, vk_enter);