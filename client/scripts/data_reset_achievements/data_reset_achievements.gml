/// @func data_reset_achievements()
function data_reset_achievements() {
	for (var i = 0; i < achievement_list_length - 1; i++) {
		global.__data_save[$ "Data"][$ "Achievements"][i] = false;
		global.__achievement_list[i].is_taken = false;
	}
	
	room_goto(room);
}