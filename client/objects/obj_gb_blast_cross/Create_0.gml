event_inherited();
depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(char_cross_xtale);
soul_invulnerability = get_char_invulnerability(char_cross_xtale) ? 20 : 1;
destructible = false;

_angle = 0;

stage = 0;

max_scale = 3;

image_xscale = 1;
image_yscale = 0.5;

max_xscale = sqrt(room_width*room_width + room_height*room_height);