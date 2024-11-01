// GUI
var size = display_get_gui_size();

// Players info
var player_id = 0;
var player = fight_get_player(player_id);
var player_frame = player.frame;

var opp_id = 1;
var opp = fight_get_player(opp_id);
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
draw_reset();
draw_sprite(player_frame, 0, frame_x, frame_y);
draw_set_font(global._font_main_mini);
draw_set_halign(fa_left);

var color = global.rating_mode ? your_rp_values.color : c_white;
if (account.type == account_type.developer) {
	color = c_rainbow;
}

if (account != undefined && profile != undefined) {
	draw_text_outlined(frame_x, frame_y + frame_w + 5, color, color_text_outline_opp, account.username);
	draw_rp(frame_x, frame_y + frame_w + 18, color_text_opp, color_text_outline_opp, your_rp);

	if (profile.badge != undefined && opp_badge != pointer_null) {
		draw_sprite(spr_badges, profile.badge, chr_x - string_width(account.username) / 2 - 10, chr_y - chr_h - 14);
	}
	
	draw_set_font(font_console_mini);
	draw_set_halign(fa_center);
	draw_text_outlined(chr_x, chr_y - chr_h - 10, color_text_opp, color_text_outline_opp, account.username);
}

draw_sprite(opp_frame, 0, size.x - frame_x - frame_w, frame_y);

color = global.rating_mode ? opp_rp_values.color : c_white;
if (opponent_get_type(opp_id) == account_type.developer) {
	color = c_rainbow;
}

draw_set_font(global._font_main_mini);
draw_set_halign(fa_right);
draw_text_outlined(size.x - frame_x, frame_y + frame_w + 5, color, color_text_outline_opp, opp_name);
draw_rp(size.x - frame_x, frame_y + frame_w + 18, color_text_opp, color_text_outline_opp, opp_rp);

// Opponent name
draw_set_font(font_console_mini);
draw_set_halign(fa_center);

if (opp_badge != undefined && opp_badge != pointer_null) {
	draw_sprite(spr_badges, opp_badge, opp_x - string_width(opp_name) / 2 - 10, opp_y - opp_h - 14);
}

draw_text_outlined(opp_x, opp_y - opp_h - 10, color_text_opp, color_text_outline_opp, opp_name);
