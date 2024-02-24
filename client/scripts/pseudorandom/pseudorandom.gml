function pseudorandom() {
	random_set_seed((current_second + 1) * (current_minute + 1) + fps_real - 1);
}