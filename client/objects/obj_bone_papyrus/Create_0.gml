event_inherited();

damage = get_char_damage(obj_character_papyrus);

change_scale = function(counst, step) {	
	scale_const = counst;
	scale_time = step;
}

is_target = false
on_target = 0

target = function (on_target) {
	is_target = true;
	self.on_target = on_target;
}	

soul_invulnerability = 20;

moving = false;

time_source_charging_exit = false;

destroy_left = false;	

move = 0;