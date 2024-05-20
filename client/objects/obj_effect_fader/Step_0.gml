//// Update time
if (fade) {
	if (stage == FADER_STAGE.IN) {
		_alpha = approach(_alpha, 1, 1 / convert_seconds_to_steps(duration_in));
	}
	if (stage == FADER_STAGE.HOLD) {
		if (duration_hold == 0) {
			stage = FADER_STAGE.OUT;
		} else {
			time_source_hold = time_source_create(time_source_game, duration_hold, time_source_units_seconds, function() {
				stage = FADER_STAGE.OUT;
			});
			time_source_start(time_source_hold);
		}
	}
	if (stage == FADER_STAGE.OUT) {
		_alpha = approach(_alpha, 0, 1 / convert_seconds_to_steps(duration_out));
	}
}

// State check
if (stage == FADER_STAGE.IN && _alpha == 1) {
	on_end_fade();
	stage = FADER_STAGE.HOLD;
}

if (stage == FADER_STAGE.OUT && _alpha == 0) {
	instance_destroy();
}
