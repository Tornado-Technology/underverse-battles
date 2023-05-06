if (room != room_fight_end and room != room_fight_1v1_end) exit;

var width  = display_get_gui_width();
var height = display_get_gui_height();

// Surface
if (!surface_exists(surface)) { surface = surface_create(surface_size.x, surface_size.y); }

if (shift > 0) {
	arrows.up.draw(width - 12, surface_cord.y + 8);
}

if (shift < action_list_size * 20 - 120) {
	arrows.down.draw(width - 12, surface_cord.y + surface_size.y - 8, 1, 180);
}

// Draw
draw_reset();
draw_set_font(global._font_main_determination);

// Left text
draw_set_halign(fa_left);
draw_text(40, 90, character_name[0]);

// Right text
draw_set_halign(fa_right);
draw_text(width - 40, 90, character_name[1]);

// Surface target
surface_set_target(surface) {
draw_clear_alpha(c_white, 0);

#region Surface
var i = 0; repeat(action_list_size) {
	var width = surface_size.x;
	var text_y = 20 * i - shift;
	
	if (text_y > surface_size.y) continue;
	
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	if (i % 2 == 0) {
		draw_text(0, text_y, string(i div 2 + 1)+".");
	}
	
	// Player 0 actions
	var player_id = 0;
	
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	if (i < array_length(initiative)) {
		if (initiative[i] == player_id) {
			draw_set_color(c_yellow);
		}
	}
	
	var text_x = 20;
	draw_selected_action(text_x , text_y, character_attack[initiative[i], 0], player_id, fight_action_type.attack1, i);
	draw_selected_action(text_x , text_y, character_attack[initiative[i], 1], player_id, fight_action_type.attack2, i);
	draw_selected_action(text_x , text_y, character_attack[initiative[i], 2], player_id, fight_action_type.attack3, i);
	draw_selected_action(text_x , text_y, character_special_attack[initiative[i]], player_id, fight_action_type.special_attack, i);
	draw_selected_action(text_x , text_y, lang_skip, player_id, fight_action_type.skip, i);
	
	// Actions
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	
	if (i < array_length(getting_damage)) {
		if (getting_damage[i] > 0)
			draw_text(width / 2, text_y, getting_damage[i]);
		if (getting_damage[i] < 0) {
			draw_set_color(c_green);
			draw_text(width / 2, text_y, -getting_damage[i]);
			draw_set_color(c_white);
		}
		if (getting_damage[i] == 0) {
			if (selected_action[0, i] == selected_action[1, i])
				draw_text(width / 2, text_y, lang_dodge);
			else
				draw_text(width / 2, text_y, lang_miss);
		}
	}
	
	// Player 1 actions
	player_id = 1;
	
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	
	if (i < array_length(initiative)) {
		if (initiative[i] == player_id) {
			draw_set_color(c_yellow);
		}
	}
	
	var text_x = width;
	draw_selected_action(text_x, text_y, character_attack[initiative[i], 0], player_id, fight_action_type.attack1, i);
	draw_selected_action(text_x, text_y, character_attack[initiative[i], 1], player_id, fight_action_type.attack2, i);
	draw_selected_action(text_x, text_y, character_attack[initiative[i], 2], player_id, fight_action_type.attack3, i);
	draw_selected_action(text_x, text_y, character_special_attack[initiative[i]], player_id, fight_action_type.special_attack, i);
	draw_selected_action(text_x, text_y, lang_skip, player_id, fight_action_type.skip, i);
	
	i++;
}
#endregion

// Reset
draw_reset();

// Reset Target
} surface_reset_target();

// Draw surface
draw_surface(surface, surface_cord.x, surface_cord.y);

// Rating
var gui_width  = display_get_gui_width();
draw_set_halign(fa_center);
draw_set_font(global._font_main_mini);
if (is_winner != -1) {
	var string_symbol = rating > 0 ? "+" : "";
	draw_text(gui_width / 2, 90, string_symbol + string(rating) + " " + string_rp);
}