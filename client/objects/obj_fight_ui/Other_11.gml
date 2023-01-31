var size = display_get_gui_size();

//Shift
shift = lerp(shift, 0, 0.2);

// Players info
var player_id = 0;
var player = fight_get_enemy(player_id);
var player_frame = player.frame;

var enemy_id = 1;
var enemy = fight_get_enemy(enemy_id);
var opp_x = enemy.x;
var opp_y = enemy.y;
var opp_h = enemy.sprite_height;
var opp_frame = enemy.frame;

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