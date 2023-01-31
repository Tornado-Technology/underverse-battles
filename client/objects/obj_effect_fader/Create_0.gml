// Main
sprite_index = noone;
fade = false;

target_gui   = false;
_depth       = 0; // Not work is gui
duration_in  = 0; // In seconds
duration_out = 0; // In seconds
color_in     = c_black;
color_out    = c_black;

on_end_fade = function() {}

// Dev
depth     = _depth;
_state_in = true;
_alpha    = 0;