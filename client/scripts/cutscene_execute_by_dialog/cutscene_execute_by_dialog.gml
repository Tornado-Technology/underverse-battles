function cutscene_execute_by_dialog(index, callback) {
	if (instance_exists(instance_dialog)) {
		if (instance_dialog.ui.current_index == index) {
			callback();
			return true;
		}
		return false;
	}
	return true;
}