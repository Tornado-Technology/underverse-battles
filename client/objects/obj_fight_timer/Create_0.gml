sprite_index = noone;
depth = -1;

switch_on = true;

time = 0;
time_max = 10;

#region Functions
timeout = function () {
	fight_set_player_skip(0);
	
	if (fight_network_mode) {
		send_fight_skip();
		timer_switch(false);
	}
}

function timer_get_id() {
	return obj_fight_timer.source;
}

function timer_set_time_max(time) {
	obj_fight_timer.time_max = time;
	time_source_reconfigure(obj_fight_timer.source, time, time_source_units_seconds, obj_fight_timer.timeout, [], -1);
}
#endregion

source = time_source_create(time_source_game, time_max, time_source_units_seconds, timeout);