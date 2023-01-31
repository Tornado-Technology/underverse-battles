function cutscene_wait_dialog_end() {
	if (!instance_exists(instance_dialog)) {
		dialog_created = false;
		return true;
	}
	return false;
}