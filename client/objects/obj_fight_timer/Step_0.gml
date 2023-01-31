if (state == TIMER_STATE.START) {
	time = time_max;
	alarm[0] = room_speed;
	state = TIMER_STATE.WORK;
}

if (state == TIMER_STATE.STOP) {
	time = time_max;
}