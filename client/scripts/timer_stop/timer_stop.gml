function timer_stop() {
	if (!obj_fight_timer.switch_on) return;
	time_source_reset(obj_fight_timer.source);
}