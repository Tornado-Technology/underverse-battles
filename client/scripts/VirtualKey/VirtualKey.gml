function VirtualKey(index, sprite, key) constructor {
	self.key = key;
	
	keyboard_key_release(key);
	
	ui = new UIImageButton(index, sprite)
		.set_on_press(function() {
			keyboard_key_press(key);
		})
		.set_on_release(function() {
			keyboard_key_release(key);
		})
	ui.is_multi_touch = true;
	
	static draw = function(position_x, position_y) {
		ui.draw(position_x, position_y);
	}
}