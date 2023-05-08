event_inherited();
depth = fight_depth.bullet_outside_hight;

var current_player = fight_get_player(fight_get_iniciative());
damage = get_char_damage(current_player);
soul_invulnerability = get_char_invulnerability(current_player) ? 20 : 1;
destructible = false;

_angle = 0;

stage = 0;

max_scale = 3;

image_xscale = 1;
image_yscale = 0.5;

max_xscale = sqrt(room_width*room_width + room_height*room_height);