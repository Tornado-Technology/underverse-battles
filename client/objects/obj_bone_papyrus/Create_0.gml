event_inherited();

soul_invulnerability = 20;
damage = get_char_damage(obj_character_papyrus);

outside_room_destroy = true;

is_target = false
on_target = 0

target = function (on_target) {
	is_target = true;
	self.on_target = on_target;
}

moving = false;

time_source_charging_exit = false;

destroy_left = false;	

move = 0;