function timer_pause() {
	if (!obj_fight_timer.switch_on) return;
	time_source_pause(obj_fight_timer.source);
}