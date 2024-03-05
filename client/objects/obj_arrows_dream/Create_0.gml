event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

soul_invulnerability = 20;

speed_const = 3;

size_ricochet = _power;

move = false;

touching_walls = false;

time_ricochet = 1;

probabiity_ricochet = fight_random_integer(1, 100);

got_ricocher = false;

if (probabiity_ricochet <= 15 + _power * 10) {
	got_ricocher = true;
};
event_user(0);	