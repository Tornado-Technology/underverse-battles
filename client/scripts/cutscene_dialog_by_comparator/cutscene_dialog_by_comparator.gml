/// @param {Any} dialog
function cutscene_dialog_by_comparator(comparator, dialog1, dialog2, side = dir.up) {
	if (!instance_exists(instance_dialog)) {
		if (!dialog_created) {
			if (comparator)
				instance_dialog = dialog_create(dialog1, side);
			else
				instance_dialog = dialog_create(dialog2, side);
			dialog_created = true;
			return false;
		}
		
		dialog_created = false;
		return true;
	}
	
	return false;
}