function timer_start(){
	if (!instance_exists(fight_timer))
		exit;
	if (fight_timer.state == TIMER_STATE.WORK)
		exit;
	fight_timer.state = TIMER_STATE.START;
}