//// Update time
if (fade) {
	_alpha = approach(_alpha, _state_in ? 1 : 0, 1 / convert_seconds_to_steps(_state_in ? duration_in : duration_out));
}

// State check
if (_state_in && _alpha == 1) {
	_state_in = false;
}

if (!_state_in && _alpha == 0) {
	on_end_fade();
	instance_destroy();
}
