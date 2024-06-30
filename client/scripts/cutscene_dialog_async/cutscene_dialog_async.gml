/// @param {Any} dialog
/// @param {Real} side
function cutscene_dialog_async(dialog, side = dir.up) {
	if (!instance_exists(instance_dialog)) {
		if (!dialog_created) {
			instance_dialog = dialog_create(dialog, side);
			dialog_created = true;
		}
		dialog_created = false;
	}
	
	return true;
}