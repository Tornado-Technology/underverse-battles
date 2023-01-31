function timer_stop(){
	if (!instance_exists(fight_timer))
		exit;
	fight_timer.state = TIMER_STATE.STOP;
}