/// @param {Any} dialog
function cutscene_choise(dialog, callback, shift = 0) {
	if (!instance_exists(instance_dialog)) {
		if (!dialog_created) {
			instance_dialog = choise_create(dialog, callback);
			instance_dialog.shift = shift;
			dialog_created = true;
			return false;
		}
		
		dialog_created = false;
		return true;
	}
	
	return false;
}
