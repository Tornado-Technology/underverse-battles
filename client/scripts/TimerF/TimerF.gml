function timer_expired() {
	if (!instance_exists(obj_fight_timer)) return;
	if (obj_fight_timer.time > 0) return false;
	
	return true;
}

function timer_start() {
	if (!instance_exists(obj_fight_timer)) return;
	if (obj_fight_timer.state == TIMER_STATE.DISABLED) return;
	if (obj_fight_timer.state == TIMER_STATE.WORK) return;
	
	obj_fight_timer.state = TIMER_STATE.START;
}

function timer_stop() {
	if (!instance_exists(obj_fight_timer)) return;
	if (obj_fight_timer.state == TIMER_STATE.DISABLED) return;
	
	obj_fight_timer.state = TIMER_STATE.STOP;
}

function timer_set_time(time) {
	if (!instance_exists(obj_fight_timer)) return;
	obj_fight_timer.time = time;
}

function timer_switched_off() {
	if (!instance_exists(obj_fight_timer)) return;
	obj_fight_timer.state = TIMER_STATE.DISABLED;
}

function timer_switched_on() {
	if (!instance_exists(obj_fight_timer)) return;
	obj_fight_timer.state = TIMER_STATE.STOP;
}
