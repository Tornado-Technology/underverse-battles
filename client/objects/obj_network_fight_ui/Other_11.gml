// GUI
var size = display_get_gui_size();

// Players info
var player = fight_get_player(0);
var player_frame = player.frame;


var player = fight_get_player(1);
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

// Draw settings
draw_reset();

// Player 0 frame
draw_sprite(player_frame, 0, frame_x, frame_y);

var frame_text_color_rating = c_white;
var frame_text_color_outline = c_black;
var nickname_text_color = c_white;
var nickname_text_color_outline = c_black;
	
// All info about player 0
if (is(account) && is(profile)) {
	var frame_text_x = frame_x;
	var frame_text_y = frame_y + frame_w + 5;
	var frame_text_color = profile.get_color();
	var username_text = account.get_username();
	var rating_text = sprintf("{0} {1}", profile.get_rating(), rating_text_postfix); 
	
	draw_set_font(global._font_main_mini);
	draw_set_halign(fa_right);
	
	draw_text_outlined(frame_text_x, frame_text_y, frame_text_color, frame_text_color_outline, username_text);
	draw_text_outlined(frame_text_y, frame_text_y + 13, frame_text_color_rating, frame_text_color_outline, rating_text);
	
	var nickname_text_x = chr_x;
	var nickname_text_y = chr_y - chr_h - 10;
	var nickname_text = account.get_nickname();
	
	var badge = profile.get_badge();
	if (is(badge)) {
		draw_sprite(spr_badges, badge, nickname_text_x - string_width(nickname_text) / 2 - 10, nickname_text_y - 4);
	}
	
	draw_set_font(font_console_mini);
	draw_set_halign(fa_center);
	
	draw_text_outlined(nickname_text_x, nickname_text_y, nickname_text_color, nickname_text_color_outline, nickname_text);
}

draw_sprite(opp_frame, 0, size.x - frame_x - frame_w, frame_y);

// All info about player 1
if (is(opponent_info)) {
	var frame_text_x = size.x - frame_x;
	var frame_text_y = frame_y + frame_w + 5;
	var frame_text_color = opponent_info.get_color();

	var username_text = opponent_info.get_username();
	var rating_text = sprintf("{0} {1}", opponent_info.get_rating(), rating_text_postfix); 

	draw_set_font(global._font_main_mini);
	draw_set_halign(fa_right);
	
	draw_text_outlined(frame_text_x, frame_text_y, frame_text_color, frame_text_color_outline, username_text);
	draw_text_outlined(frame_text_x, frame_text_y + 13, frame_text_color_rating, frame_text_color_outline, rating_text);

	var nickname_text_x = opp_x;
	var nickname_text_y = opp_y - opp_h - 10;
	var nickname_text = account.get_nickname();

	var badge = opponent_info.get_badge();
	if (is(badge)) {
		draw_sprite(spr_badges, badge, nickname_text_x - string_width(nickname_text) / 2 - 10, nickname_text_y - 4);
	}
	
	draw_set_font(font_console_mini);
	draw_set_halign(fa_center);

	draw_text_outlined(nickname_text_x, nickname_text_y, nickname_text_color, nickname_text_color_outline, nickname_text);
}
