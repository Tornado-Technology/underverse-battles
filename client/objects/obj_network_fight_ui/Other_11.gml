// GUI
var size = display_get_gui_size();

// Players info
var player_id = 0;
var player = fight_get_player(player_id);
var player_frame = player.frame;

var player_id = 1;
var player = fight_get_player(player_id);
var opp_x = player.x;
var opp_y = player.y;
var opp_h = player.sprite_height;
var opp_frame = player.frame;

player = fight_get_player(0);
var chr_x = player.x;
var chr_y = player.y;
var chr_h = player.sprite_height;
var chr_frame = player.frame;

// Colors
var color_text_opp = c_white;
var color_text_outline_opp = c_black;

//Shift
shift = lerp(shift, 0, 0.2);

//Other variables
var frame_x = 5 - shift;
var frame_y = 5;
var frame_w = 46;

// Player 1
draw_sprite(player_frame, 0, frame_x, frame_y);

draw_set_font(font_mini);
draw_set_halign(fa_left);

var color = your_rp_values[1];
if (account.type == account_type.developer) {
	color = c_rainbow;
}

if (account != undefined && profile != undefined) {
	draw_text_outlined(frame_x, frame_y + frame_w + 12, color, color_text_outline_opp, account.username);
	draw_text_outlined(frame_x, frame_y + frame_w + 25, color_text_opp, color_text_outline_opp, string(your_rp) + " " + translate_get("Battle.Rating"));

	if (profile.badge != undefined) {
		draw_sprite(spr_badges, profile.badge, chr_x - string_width(account.username) / 2 - 10, chr_y - chr_h - 14);
	}
	
	draw_set_font(font_console_mini);
	draw_set_halign(fa_center);
	draw_text_outlined(chr_x, chr_y - chr_h - 10, color_text_opp, color_text_outline_opp, account.username);
}

draw_sprite(opp_frame, 0, size.x - frame_x - frame_w, frame_y);

color = opp_rp_values[1];
if (opponent_get_type(player_id) == account_type.developer) {
	color = c_rainbow;
}

draw_set_font(font_mini);
draw_set_halign(fa_right);
draw_text_outlined(size.x - frame_x, frame_y + frame_w + 12, color, color_text_outline_opp, account.username);
draw_text_outlined(size.x - frame_x, frame_y + frame_w + 25, color_text_opp, color_text_outline_opp, string(opp_rp) + " " + translate_get("Battle.Rating"));

// Opponent name
draw_set_font(font_console_mini);
draw_set_halign(fa_center);

var badge_name = opponent_get_name(player_id);
if (opp_badge != 0) {
	draw_sprite(spr_badges, opp_badge, opp_x - string_width(badge_name) / 2 - 10, opp_y - opp_h - 14);
}

draw_text_outlined(opp_x, opp_y - opp_h - 10, color_text_opp, color_text_outline_opp, badge_name);
