function dialog_create(str) {
	var dialog = str;
	if (!is_array(str)) {
		dialog = translate_get("Dialog." + str);
	}
	
	var inst = instance_create(obj_dialog);	
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