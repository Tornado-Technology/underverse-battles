if (state == TIMER_STATE.STOP || state == TIMER_STATE.DISABLED)
	exit;

time--;

if (time > 0)
	alarm[0] = room_speed;