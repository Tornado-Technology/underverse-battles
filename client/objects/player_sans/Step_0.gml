if (global.pause_game) exit;

if (!moveable) {
	if (sprite_index == spr_char_sans_walk_right || sprite_index == spr_char_sans_walk_left)
	sprite_index = spr_char_sans_idle;
	image_speed = 1;
	exit;
}

if (movement_speed_x == 0) {
	sprite_index = spr_char_sans_idle;
	//image_speed = 0;
	//image_index = 4;
} else {
	sprite_index = spr_char_sans_walk_right;
	//image_speed = 1;
}

/* Update direction */
if (movement_speed_x > 0)
	image_xscale = 1;
if (movement_speed_x < 0)
	image_xscale = -1;

var SPD = 2;

/* Control */
if (input_check_held(input.right)) 
	movement_speed_x = SPD;
if (input_check_held(input.left)) 
	movement_speed_x = -SPD;
	
/* Reset movoment speed */
if (!input_check_held(input.up)	&& !input_check_held(input.down)) 
	movement_speed_y = 0;

if (!input_check_held(input.right) && !input_check_held(input.left)) 
	movement_speed_x = 0;

/* Change position */
x += movement_speed_x;