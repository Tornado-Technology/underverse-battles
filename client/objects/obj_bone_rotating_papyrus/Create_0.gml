event_inherited();

damage = get_char_damage(obj_character_papyrus);

scale_const = 0;
scale_time = 0;

soul_invulnerability = 20;

change_scale = function(counst, step) {	
	scale_const = counst;
	scale_time = step;
}