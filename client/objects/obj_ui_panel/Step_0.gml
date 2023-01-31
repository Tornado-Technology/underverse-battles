/// @desc Update
blackout_alpha = lerp(blackout_alpha, to_close ? 0 : blackout_alpha_target, 0.1);

if (to_close) {
	if (blackout_alpha == 0) {
		instance_destroy();
	}
	
	exit;
}

input_update();
