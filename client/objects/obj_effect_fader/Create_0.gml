// Main
sprite_index = noone;
fade = false;

use_draw_gui_end = false;
duration_in = 0; // In seconds
duration_hold = 0; // In seconds
duration_out = 0; // In seconds
_color = c_black;

on_end_fade = function() {}

// Enum
enum FADER_STAGE {
	IN,
	HOLD,
	OUT
}

// Dev
stage = FADER_STAGE.IN;
_alpha = 0;

// Time source
time_source_hold = noone;