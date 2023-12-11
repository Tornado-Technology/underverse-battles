if (!is_enable) exit;

foreach_buttons(function(button) {
	button.instance.UI.scale_x = button.scale;
	button.instance.UI.scale_y = button.scale;
	button.instance.draw(button.position_x, button.position_y);
})