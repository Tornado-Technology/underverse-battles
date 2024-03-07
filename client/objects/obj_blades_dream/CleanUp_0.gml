if (is_directions) {
	time_source_destroy(time_source_destroy_blades);
}

if (is_swung) {
	time_source_destroy(time_source_move_start);	
	time_source_destroy(time_source_move_next);
	time_source_destroy(time_source_move_finish);	
}