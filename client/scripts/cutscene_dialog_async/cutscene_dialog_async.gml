/// @param {Any} dialog
function cutscene_dialog_async(dialog, shift = 0) {
	if (!instance_exists(instance_dialog)) {
		if (!dialog_created) {
			instance_dialog = dialog_create(dialog);
			instance_dialog.shift = shift;
			dialog_created = true;
		}
		dialog_created = false;
	}
	
	return true;
}