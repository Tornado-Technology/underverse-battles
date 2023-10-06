// State
var state     = fight_get_state();
var in_fight  = state == fight_state.battle;
var in_chouse = state == fight_state.choosing;

// Inciative
var initiative      = fight_get_initiative();
var initiative_next = fight_get_next_initiative();
var is_player_turn  = initiative == 0;

// player 
var player_position = new Vector2(fight_get_player_position_x(initiative_next), fight_get_player_position_y(initiative_next));
var player_height   = fight_get_player(initiative_next).sprite_height;

// GUI
var size = display_get_gui_size();
var size_center = display_get_gui_size().divis(2, 2);

// Player things
var action = fight_get_player_input_action();
var selected_power = fight_get_player_input_power();

// Controller (Mobile)
if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = show_mobile_ui;
	global.__ui_virtual_buttons_instance.is_enable = show_mobile_ui;
}

// Draw
draw_reset();

// Show UI
if (!show_ui || cinematic_mode) exit;

// Option bar
draw_set_alpha(in_fight ? alpha_option_bar : 1);

var bar_y = 25;
if (showing_option_bar) { 
	draw_sprite(spr_ui_options_bar_border, 0, size_center.x, bar_y); 
}

if (showing_option_bar_bg) { 
	draw_sprite(spr_ui_options_bar_background, 0, size_center.x, bar_y); 
}

// Main stats text
draw_set_font(font_console_mini);

draw_set_halign(fa_right);
draw_text_outlined(size_center.x - 136, 10, c_red,   c_black, fight_get_player_hp(0));
draw_text_outlined(size_center.x - 135, 18, c_white, c_black, fight_get_player_stamina(0));

draw_set_halign(fa_middle);
draw_text_outlined(size_center.x - 126, 22, c_aqua,  c_black, fight_get_player_mana(0));

draw_set_halign(fa_left);
draw_text_outlined(size_center.x + 136, 10, c_red,   c_black, fight_get_player_hp(1));
draw_text_outlined(size_center.x + 135, 18, c_white, c_black, fight_get_player_stamina(1));

draw_set_halign(fa_middle);
draw_text_outlined(size_center.x + 126, 22, c_aqua,  c_black, fight_get_player_mana(1));

// Main darw
var color = c_white;
var alpha = draw_get_alpha();

// Plyaer 1
draw_sprite_part(option_bar_sprites[0], 0, 0, 0, current_hp_line[0], option_bar_height[0], size_center.x - 131, 10);
draw_sprite_part(option_bar_sprites[1], 0, 0, 0, current_stamina_line[0], option_bar_height[1], size_center.x - 130, 18);
draw_sprite_part(option_bar_sprites[2], 0, 0, 0, current_mana_line[0], option_bar_height[2], size_center.x - 117, 21);

// Plyaer 2
draw_sprite_part_ext(option_bar_sprites[0], 0, 0, 0, current_hp_line[1],      option_bar_height[0], size_center.x + 132, 10, -1, 1, color, alpha);
draw_sprite_part_ext(option_bar_sprites[1], 0, 0, 0, current_stamina_line[1], option_bar_height[1], size_center.x + 131, 18, -1, 1, color, alpha);
draw_sprite_part_ext(option_bar_sprites[2], 0, 0, 0, current_mana_line[1],    option_bar_height[2], size_center.x + 118, 21, -1, 1, color, alpha);

// Bar flashing
if (in_chouse && data_get("Settings.UI.Fight.ShowUsage")) {
	var flashing_duration = 1;
	var stamina_usage = fight_get_player_action_stamina_cost(initiative, action);
	var stamina_flashing_bar_width = option_bar_width[1] / fight_get_player_max_stamina(initiative) * stamina_usage;
	var mana_usage = fight_get_player_action_mana_cost(initiative, selected_power);
	var mana_flashing_bar_width = option_bar_width[2] / fight_get_player_max_mana(initiative) * mana_usage;
	
	if (initiative == 0) {
		draw_set_alpha(wave(0, 0.75, flashing_duration));
		draw_sprite_part(spr_ui_options_bar_stamina_usage, 0, current_stamina_line[initiative] - stamina_flashing_bar_width, 0, stamina_flashing_bar_width, option_bar_height[1], size_center.x - 130 + current_stamina_line[initiative] - stamina_flashing_bar_width, 18);
		
		draw_set_alpha(wave(0, 0.75, flashing_duration));
		draw_sprite_part(spr_ui_options_bar_mana_usage, 0, current_mana_line[initiative] - mana_flashing_bar_width, 0, mana_flashing_bar_width, option_bar_height[2], size_center.x - 117 + current_mana_line[initiative] - mana_flashing_bar_width, 21);
		draw_set_alpha(default_draw_alpha);
	}

	if (initiative == 1) {
		draw_sprite_part_ext(spr_ui_options_bar_stamina_usage, 0, current_stamina_line[initiative] - stamina_flashing_bar_width, 0, stamina_flashing_bar_width, option_bar_height[1], size_center.x + 131 - current_stamina_line[initiative] + stamina_flashing_bar_width, 18, -1, 1, color, wave(0, 0.75, flashing_duration));
		draw_set_alpha(default_draw_alpha);
	}
}

// Show frames
event_user(1);

// Reset
draw_reset();

// Action Box
draw_set_font(global._font_main_determination);

// Positions values
var soul = fight_get_player_soul(0);

// Draw Action border
if (action_box_show && showing_action_box_power && is_player_turn) { 
	draw_sprite(spr_fight_ui_bar_power, selected_power, action_box_position.x + action_box_size.x / 2, action_box_position.y);
}

// Draw Action text
if (action_box_show) {
	draw_sprite_stretched(spr_fight_ui_action_box, 0, action_box_position.x, action_box_position.y, action_box_size.x, action_box_size.y);
	
	var i = 0;
	repeat(3) {
		var name = fight_get_action_name(initiative, i);
		var is_tried = fight_get_player_stamina(initiative) >= fight_get_player_action_stamina_cost(initiative, i); 
		var is_selcet = action == i;
		var offset_postion = new Vector2(0, i * 18);
		
		var text_position = new Vector2(5, 2).add(offset_postion).add(action_box_position);
		var soul_position = new Vector2(9, 10).add(offset_postion).add(action_box_position);

		var color = is_tried ? (is_selcet ? text_select_color : text_simple_color) : text_tired_color;
		
		// Draw check
		if (is_selcet) {
			text_position.x += 15;
			draw_sprite(soul, 0, soul_position.x, soul_position.y);
		} else { 
			name = string("* {0}", name); 
		}
		
		// Draw text
		draw_text_color(text_position.x, text_position.y, name, color, color, color, color, 1);
		
		var width = is_selcet ? sprite_get_width(soul) : string_width("* ");
		var hover = point_in_rectangle_gui(text_position.x, text_position.y, width + text_position.x + text_name_actions_width[i], text_position.y + text_name_actions_height[i]);
		
		// Collision
		if (hover && mouse_check_button_pressed(mb_any) && instance_exists(obj_fight_input)) {
			if (is_selcet) {
				global.fight_instance.required_components.input.confirm_action_and_power();
			} else {
				global.fight_instance.required_components.input.set_selected_action(i);
			}
		}
		
		i++;
	}
}

// Special action
if (action_box_show && showing_special_action && fight_player_selecting(0) && is_player_turn) {
	special_button.draw(special_action_position_x, special_action_position_y);
	
	draw_set_font(font_console_mini);
	draw_set_halign(fa_center);
	draw_text_outlined(special_action_position_x, special_action_position_y + 20, text_simple_color, c_black, string(fight_get_player_special_action_percent(0))+"%");
}

// Skip
if (showing_skip && is_player_turn && fight_get_player_stamina(0) < fight_get_player_action_stamina_cost(0, 1) && in_chouse) {
	draw_set_font(global._font_main_mini);
	draw_set_halign(fa_center);
	draw_text_outlined(size_center.x, size.y - 120, text_simple_color, c_black, text_skip);
}

// initiative
draw_reset();
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

// initiative
if (!in_fight && show_initiative) {
	draw_text_outlined(size_center.x, 60, c_white, c_black, str_initiative);
}

// Reset
draw_reset();
