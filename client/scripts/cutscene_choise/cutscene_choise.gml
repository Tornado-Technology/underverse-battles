/// @param {Any} dialog
function cutscene_choise(dialog, callback, side = dir.up) {
	if (!instance_exists(instance_dialog)) {
		if (!dialog_created) {
			instance_dialog = choise_create(dialog, callback);
			instance_dialog.side = side;
			dialog_created = true;
			return false;
		}
		
		dialog_created = false;
		return true;
	}
	
	return false;
}
