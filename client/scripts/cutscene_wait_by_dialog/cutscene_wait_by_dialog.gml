function cutscene_wait_by_dialog(str_num) {
	if (instance_exists(instance_dialog)) {
		if (instance_dialog.cur_num == str_num) {
			return true;
		}
		return false;
	}
	return true;
}