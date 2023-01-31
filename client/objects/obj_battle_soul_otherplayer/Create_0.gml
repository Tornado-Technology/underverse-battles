depth = fight_depth.soul;

image_speed = 0;

follow_board = false;
board_instance = obj_battle_border;

invincibility = 0;
collider_soul = instance_create_depth(x, y, fight_depth.soul, obj_battle_collider_soul_otherplayer);

moveable = true;
ability = false;

next_x = x;
next_y = y;

enemyId = 0;

skip_frame = 0;

is_otherplayer_soul = true;