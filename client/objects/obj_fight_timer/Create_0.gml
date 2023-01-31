sprite_index = noone;
depth = -1;

show_timer = true;

time = 10;
time_max = 10;

enum TIMER_STATE {
	DISABLED,
	START,
	WORK,
	STOP
}

state = TIMER_STATE.STOP;