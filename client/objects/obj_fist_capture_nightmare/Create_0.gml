event_inherited();
_angle = 20
soul_invulnerability = 20;
damage = get_char_damage(obj_character_nightmare);

index_sprite = 0;
outside_force_speed = 0;

target_beginning = new Vector2(x, y);
target_end = new Vector2(x, y);

move_beginning = true;

target = function (beginning, _end) {
	target_beginning = beginning
	target_end = _end;
};

capture = false;
on_soul_touch = function (soul) {
	index_sprite = 1;
	self.soul = soul;
	soul.moveable = false;
	capture = true;
	time_source_start(time_source_capture);
};




time_source_capture = time_source_create(time_source_game, 40 / 60, time_source_units_seconds, function () {});