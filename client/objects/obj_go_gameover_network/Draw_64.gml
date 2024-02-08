// Variables
var gui_width  = display_get_gui_width();
var gui_height = display_get_gui_height();

// Draw
draw_reset();
draw_set_halign(fa_middle);
draw_set_alpha(1);

// End slpah
draw_sprite(state == gameover.win ? spr_ui_victory : spr_ui_gameover, 0, gui_width / 2, gui_height / 5 - 8);

// Buttons
var local_wave = wave(2, -2, 1, 0);
buttons.menu.draw(gui_width / 2,  gui_height - 25 + local_wave);

// Reset
draw_reset();
