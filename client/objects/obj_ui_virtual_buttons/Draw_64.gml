if (!is_enable) exit;

foreach_buttons(function(button) {
	var position_x = data_get("Settings.MobileControls.Buttons." + button.name + ".Position.X");
	var position_y = data_get("Settings.MobileControls.Buttons." + button.name + ".Position.Y")
	var scale = data_get("Settings.MobileControls.Buttons." + button.name + ".Scale")
	button.instance.UI.scale_x = scale;
	button.instance.UI.scale_y = scale;
	button.instance.draw(position_x, position_y);
})