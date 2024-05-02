event_inherited();

damage = get_char_damage(obj_character_papyrus);

is_target = false
on_target = 0

target = function (on_target) {
	is_target = true;
	self.on_target = on_target;
}
moving = false;

time_source_charging_exit = false;


move = 0;