time = 0;
depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_xchara);
soul_invulnerability = 20;

image_xscale = 0;
image_yscale = 0;

_knife = [];

//Time sources
time_source_knife = time_source_create(time_source_game, 1/3, time_source_units_seconds, function () {
	_knife[0] = instance_create_depth(x, y, 0, obj_knife_directed_xchara);
	_knife[0]._target_angle = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	_knife[1] = instance_create_depth(x, y, 0, obj_knife_directed_xchara);
	_knife[1]._target_angle = _knife[0]._target_angle + 15;
	_knife[2] = instance_create_depth(x, y, 0, obj_knife_directed_xchara);
	_knife[2]._target_angle = _knife[0]._target_angle - 15;
	time_source_start(time_source_end);
});
time_source_end = time_source_create(time_source_game, 1/3, time_source_units_seconds, function () {
	instance_destroy();
});
time_source_start(time_source_knife);