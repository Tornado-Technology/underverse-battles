function timer_resume() {
	if (!obj_fight_timer.switch_on) return;
	time_source_resume(obj_fight_timer.source);
}