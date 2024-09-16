event_inherited();

damage = get_char_damage(obj_character_nightmare);
scale_const = 0;
const = 0;
scale_time = 0;
scale_start = image_yscale;
can_move = true;
index = 0

on_soul_touch = function(soul) {
	if (index >= 4) {
		fight_soul_damage(damage, destructible, id);
	};
}

change_scale = function(step, new_counst) {	
	scale_const = new_counst;
	scale_time = step;
	const = new_counst;
}

destroy = false;