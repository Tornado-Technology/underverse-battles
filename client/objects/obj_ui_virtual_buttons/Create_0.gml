is_enable = false;
buttons = {};

get_button = function(name) {
	if (variable_struct_get(buttons, name)) return buttons[$ name];
}

add_button = function(index, name, sprite, key, is_customizable = true) {
	if (!variable_struct_get(buttons, name)) {
		buttons[$ name] = {
			is_customizable: is_customizable,
			name: name,
			position_x: data_get("Settings.MobileControls.Buttons." + name + ".Position.X"),
			position_y: data_get("Settings.MobileControls.Buttons." + name + ".Position.Y"),
			scale: data_get("Settings.MobileControls.Buttons." + name + ".Scale"),
			instance: new VirtualKey(index, sprite, key),
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

disable = function() {}

draw = function(button) {
	var position_x = data_get("Settings.MobileControls.Buttons." + button.name + ".Position.X");
	var position_y = data_get("Settings.MobileControls.Buttons." + button.name + ".Position.Y")
	var scale = data_get("Settings.MobileControls.Buttons." + button.name + ".Scale")
	button.instance.ui.scale_x = scale;
	button.instance.ui.scale_y = scale;
	button.instance.draw(position_x, position_y);
}