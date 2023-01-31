/// @desc Give
if (achievements[achievement_id.defeat_ink].is_taken && achievements[achievement_id.defeat_error].is_taken) {
	if (global.__achievement_list[achievement_id.balance].is_taken == false) {
		array_push(global.__achievement_list_buffer, achievement_id.balance);
		global.__achievement_list[achievement_id.balance].is_taken = true;
	}
}