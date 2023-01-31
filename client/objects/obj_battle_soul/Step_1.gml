/// @desc Network
if (fight_network_mode) {
	if (skip_frame >= 2) {
		send_fight_soul(x, y, image_angle, ability);
		skip_frame = 0;
	} else {
		skip_frame++;
	}
}