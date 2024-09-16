event_inherited();

can_move = true;
damage = get_char_damage(obj_character_papyrus);

soul_invulnerability = 20;

min_scale = image_yscale;
max_scale = image_yscale;
current_scale = image_yscale;
scale_time = 0;

set_pulsating_scale = function(min_scale, max_scale, scale_time) {	
	self.min_scale = min_scale;
	self.max_scale = max_scale;
	self.scale_time = scale_time;
}

