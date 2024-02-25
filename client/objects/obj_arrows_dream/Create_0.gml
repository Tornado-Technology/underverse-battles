event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

soul_invulnerability = 20;

speed_const = 0;

size_ricochet = _power;

result_ricochet = function () {
	image_angle = point_direction(x, y, target.x, target.y);
}

move = false;

touching_walls = false;

target = obj_battle_soul;

probabiity_ricochet = irandom_range(1, 100);

got_ricocher = false;

if (probabiity_ricochet <= 15 + _power * 10) {
	got_ricocher = true;
};
