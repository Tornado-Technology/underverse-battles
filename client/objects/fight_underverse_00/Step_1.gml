var ui = obj_fight_ui;

if (!instance_exists(ui)) exit;

ui.ui_showing_option_bar	   = true;
ui.ui_showing_option_bar_bg	   = true;
ui.ui_showing_action_box	   = ui_showing_action_box;
ui.ui_showing_action_box_power = ui_showing_action_box && ui_showing_action_box_power;
ui.player_can_input			   = enemy_can_input[0];