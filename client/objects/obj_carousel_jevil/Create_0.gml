event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_jevil);

soul_invulnerability = 20;
backwards = false;

sprite_frame = 0;

radius = 40;

angle = 0;

alpha = 0;
image_xscale = -1;
	
destroy = false;	
	
on_soul_touch = function(soul) {
	if (image_xscale < 0) {
		fight_soul_damage(damage, destructible, id);
	} 
}