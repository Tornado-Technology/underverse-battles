event_inherited();

disable_surface = true;

soul_invulnerability = 30;

damage = get_char_damage(obj_character_jevil);

stage = 0;

step = 0.5;

step_radius = 2;

radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;
angle = point_direction(x, y, center_x, center_y);

