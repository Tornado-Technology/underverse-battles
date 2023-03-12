if (fight_get_initiative() == 1)
	alarm[0] = 30;
else
	alarm[0] = 30 + ceil(network_ping / 1000 * room_speed);
damage = 0;