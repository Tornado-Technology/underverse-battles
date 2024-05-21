function dialog_create(str, side = dir.up) {
	var dialog = str;
	if (!is_array(str)) {
		dialog = translate_get("Dialog." + str);
	}
	
	var inst = instance_create(obj_dialog, {
		dialog: dialog,
		side: side,
	});	
	
	return inst;
}