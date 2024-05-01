event_inherited();
_angle = 20;

soul_invulnerability = 20;
damage = get_char_damage(obj_character_nightmare);

pusher = 10;
index_sprite = 0;
outside_force_speed = 10;

on_soul_touch  = function (soul) {
	index_sprite = 1;
	self.soul = soul;
	soul.moveable = false;
	
	speed_count = 0;
	time_source_start(time_source_capture);
};

time_source_capture = time_source_create(time_source_game, 40 / 60, time_source_units_seconds, function () {});