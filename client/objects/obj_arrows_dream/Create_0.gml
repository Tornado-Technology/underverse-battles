event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

soul_invulnerability = 20;

speed_const = 3;

size_ricochet = _power;

move = false;

touching_walls = false;

target = obj_battle_soul;

time_ricochet = 1;

probabiity_ricochet = irandom_range(1, 100);

got_ricocher = false;

if (probabiity_ricochet <= 15 + _power * 10) {
	got_ricocher = true;
};

time_source_ricochet = time_source_create(time_source_game, time_ricochet / 60, time_source_units_seconds, function () {});