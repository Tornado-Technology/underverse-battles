/// @param {Real} index
function achievement_give(index) {
	var list = global.__achievement_list;
	
	if (list[index].is_taken == false) {
		list[index].is_taken = true;
		
		// ВАМ ПИЗДА!
		if (is_mobile) {
			global.__data_save[$ "Data"][$ "Achievements"][index] = true;
			data_save();
		}
		
		array_push(global.__achievement_list_buffer, index);
	}
	
	with (obj_achievements) {
		event_user(3);
	}
}
