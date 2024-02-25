event_inherited();
can_move = true;
scale_start = image_yscale;
damage = get_char_damage(obj_character_papyrus);
scale_const = 0;
const = 0;

change_scale = function(step, new_counst) {	
	scale_const = new_counst;
	scale_time = step;
	const = new_counst;
}

