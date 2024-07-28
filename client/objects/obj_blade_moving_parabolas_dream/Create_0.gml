event_inherited();

disable_surface = true;
damage = get_char_damage(obj_character_dream);

soul_invulnerability = 20;
angle = 0;
vertical = false;

gradually_alpha = false;

gradually_appearing = function () {
 image_alpha = 0;	
 gradually_alpha = true;	
}