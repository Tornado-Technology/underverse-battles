var size = display_get_gui_size();

//Shift
shift = lerp(shift, 0, 0.2);

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

// Colors
var color_text_opp = c_white;
var color_text_outline_opp = c_black;

//Other variables
var frame_x = 5 - shift;
var frame_y = 5;
var frame_w = 46;

// Player 1
draw_sprite(player_frame, 0, frame_x, frame_y);

// Player 2
draw_sprite(opp_frame, 0, size.x - frame_x - frame_w, frame_y);