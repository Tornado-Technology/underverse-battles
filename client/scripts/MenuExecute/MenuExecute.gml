function MenuExecute(key_translate, arguments, callback) {
	var instance = new ClassMenuExecute(key_translate, arguments, callback);
	instance.translate_update();
	
	return instance;
}

function ClassMenuExecute(key_translate, arguments, callback) : ClassMenuElement(key_translate) constructor {
	self.callback = callback;
	self.arguments = arguments;
	
	on_click = function() {	
		callback(arguments);
	}
}