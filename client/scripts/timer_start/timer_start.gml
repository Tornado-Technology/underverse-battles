function timer_start(){
	if (!obj_fight_timer.switch_on) return;
	time_source_start(obj_fight_timer.source);
}