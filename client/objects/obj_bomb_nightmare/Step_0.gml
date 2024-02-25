event_inherited();

if (time_source_get_state(time_source_explso) ==  time_source_state_stopped) {
	instance_destroy();		
}