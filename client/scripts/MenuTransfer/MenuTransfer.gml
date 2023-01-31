function MenuTransfer(key_translate, new_page_index, callback = function() {}) {
	var instance = new ClassMenuTransfer(key_translate, new_page_index, callback);
	instance.translate_update();
	
	return instance;
}

function ClassMenuTransfer(key_translate, new_page_index, callback) : ClassMenuElement(key_translate) constructor {
	self.callback = callback;
	self.new_page_index = new_page_index;
	static base_update = update;
	
	on_click = function(menu_instance) {
		audio_play_sound_once(snd_selection);
		menu_instance.goto_page(new_page_index);
		callback();
	}
	
	static update = function(position_x, position_y, menu_instance) {
		base_update(position_x, position_y, menu_instance);
	}
}