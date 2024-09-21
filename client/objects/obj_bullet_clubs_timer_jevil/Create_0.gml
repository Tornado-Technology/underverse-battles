event_inherited();


soul_invulnerability = 20;
damage = get_char_damage(obj_character_jevil);

image_alpha  = 0;
disable_surface = true;
radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;

image_angle = point_direction(x, y, obj_battle_border.x, obj_battle_border.y);

attack = false;
length_charge = 0;

time_source_start_attack = time_source_create(time_source_game, time_attack / 60, time_source_units_seconds, function () {});

time_source_start(time_source_start_attack);
