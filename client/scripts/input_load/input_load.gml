function input_load() {
	input_bind(input.up, Key(device.keyboard, data_get("Settings.Control.Up")), "Settings.Control.Up");
	input_bind(input.down, Key(device.keyboard, data_get("Settings.Control.Down")), "Settings.Control.Down");
	input_bind(input.left, Key(device.keyboard, data_get("Settings.Control.Left")), "Settings.Control.Left");
	input_bind(input.right, Key(device.keyboard, data_get("Settings.Control.Right")), "Settings.Control.Right");
	input_bind(input.action, Key(device.keyboard, data_get("Settings.Control.Action")), "Settings.Control.Action");
	input_bind(input.skip, Key(device.keyboard, data_get("Settings.Control.Skip")), "Settings.Control.Skip");
}