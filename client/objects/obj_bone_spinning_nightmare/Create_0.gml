event_inherited();

damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 20;

stage = 0;
time  = 0;
speed_const = 0;
angle_speed  = 0;

step = 0.01;

radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;

alpha = degtorad(point_direction(x, y,  center_x, center_y));