function VirtualKey(sprite, key) {
	var instance = new ClassVirtualKey(sprite, key);
	instance.init();
	
	return instance;
}

function ClassVirtualKey(sprite, key) constructor {
	self.key = key;
	
	UI = UIImageButton(sprite);
	
	static init = function() {
		UI.is_multi_touch = true;
		
		UI.on_press = function() {
			keyboard_key_press(key);
		}
		
		UI.on_release = function() {
			keyboard_key_release(key);
		}
	}
	
	static draw = function(position_x, position_y) {
		UI.draw(position_x, position_y);
	}
}