function cutscene_wait_by_dialog(index) {
	if (instance_exists(instance_dialog)) {
		if (instance_dialog.ui.current_index == index) {
			return true;
		}
		return false;
	}
	return true;
}