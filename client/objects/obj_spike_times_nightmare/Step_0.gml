event_inherited();

if (time_source_get_state(time_source_charger) == time_source_state_stopped) {
	time_source_start(time_source_attack);	
}