event_inherited();

disable_surface = true;
damage = get_char_damage(obj_character_dream);

soul_invulnerability = 20;
speed_const = 3;

stage = 0;

radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;

gradually_speed = true;

speed_angle = 0;

gradually_alpha = false;

gradually_appearing = function () {
 image_alpha = 0;	
 gradually_alpha = true;	
}