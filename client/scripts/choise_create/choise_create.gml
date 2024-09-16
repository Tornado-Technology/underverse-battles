function choise_create(str, callback, side = dir.up) {
	var dialog = str;
	if (!is_array(str)) {
		dialog = translate_get("Dialog." + str);
	}
	
	var inst = instance_create(obj_choise, {
		dialog: dialog,
		callback: callback,
		side: side
	});
	
	return inst;
}