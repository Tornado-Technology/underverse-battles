function dialog_create(str, _side = dir.up) {
	var dialog = str;
	if (!is_array(str)) {
		dialog = translate_get("Dialog." + str);
	}
	
	var inst = instance_create(obj_dialog, {side: _side});	
	inst.dialog = dialog;
	
	return inst;
}

function choise_create(str, callback) {
	var dialog = str;
	if (!is_array(str)) {
		dialog = translate_get("Dialog." + str);
	}
	
	var inst = instance_create(obj_choise);	
	inst.dialog = dialog;
	inst.callback = callback;
	
	return inst;
}