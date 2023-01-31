function cutscene_execute_by_dialog(str_num, callback) {
	if (instance_exists(instance_dialog)) {
		if (instance_dialog.cur_num == str_num) {
			callback();
			return true;
		}
		return false;
	}
	return true;
}