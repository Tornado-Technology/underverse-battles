event_inherited();

damage = obj_character_ink_sans.damage;

amount = 96;

source = time_source_create(time_source_game, 1/12, time_source_units_seconds, function () {
	var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans,
							obj_drop_orange_ink_sans,
							obj_drop_black_ink_sans);
	instance_create_depth(x, y, fight_depth.bullet_outside_hight, inst_drop, {
		direction: random_range(0, 360),
		image_angle: direction + 90
	});
}, [], amount);

time_source_start(source);