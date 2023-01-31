/// @param {Bool} hard
function data_reset(hard = true) {
	if (DATA_ENCRIPTION) {
		data_reset_protected();
	} else {
		file_delete(DATA_FILE_PATH);
		__data_try_create_file();
	}
	
	if (hard) {
		room_goto(room);
	}
}
