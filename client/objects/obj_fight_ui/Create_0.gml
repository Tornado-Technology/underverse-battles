var size = display_get_gui_size();

// Disable render icon
sprite_index = noone;

// Required animation curve
anim_asset = anim_ui_fight;

// Channels
channel_action_box_start_y = animcurve_get_channel(anim_asset, "action_box_start_y");
channel_action_box_end_y   = animcurve_get_channel(anim_asset, "action_box_end_y");

// Configure params
channel_position = 0;
channel_speed = 0.02;
// #####################

// Action box position
action_box_show = true;

action_box_position_end   = new Vector2(130, 360);
action_box_position_start = new Vector2(130, 210);
action_box_size           = new Vector2(220, 56);

action_box_position       = action_box_position_start.copy();
// #####################

show_select = true;

option_bar_sprites = [spr_ui_options_bar_hp, spr_ui_options_bar_stamina, spr_ui_options_bar_mana];
current_hp_line      = [0, 0];
current_mana_line    = [0, 0];
current_stamina_line = [0, 0];
option_bar_width  = [0, 0, 0];
option_bar_height = [0, 0, 0];

// New code
text_skip = translate_get("Battle.LittleStamina") + "\n[X] - " + translate_get("Battle.Skip");

// Shows
show_ui = true;
show_mobile_ui = true;
show_initiative = data_get("Settings.UI.Fight.TurnText");
alpha_option_bar = data_get("Settings.UI.Fight.StatbarStyle");

// Actions
action_box_alpha = 1;
action_box_alpha_text = 1;

alarm[0] = 2;

str_initiative = translate_get("Battle.YoureAttacking");

player_can_input = true;
player_can_input_skip = true;

showing_option_bar	  = true;
showing_option_bar_bg = true;

showing_action_box_power	= true;
showing_special_action		= true;
showing_skip				= true;

text_simple_color = c_white;
text_select_color = c_yellow;
text_tired_color  = c_ltgrey;

low_stamina_message_alpha = 0;
low_mana_message_alpha = 0;

shift = 100;

// Name action
text_name_actions_width = [0, 0, 0];
text_name_actions_height = [0, 0, 0];

special_action_position_x = size.x - 90;
special_action_position_y = size.y - 40;

special_button = new UIImageButton(0, spr_empty)
	.set_on_press(function() {
		obj_fight_input.special_action();
	});

if (is_mobile || mobile_mode) {
	special_action_position_x = data_get("Settings.MobileControls.Buttons.SpecialAction.Position.X");
	special_action_position_y = data_get("Settings.MobileControls.Buttons.SpecialAction.Position.Y");
	special_button.scale_x = data_get("Settings.MobileControls.Buttons.SpecialAction.Scale");
	special_button.scale_y = data_get("Settings.MobileControls.Buttons.SpecialAction.Scale");
}