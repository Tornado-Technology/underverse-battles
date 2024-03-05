event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

type = fight_random_integer(0, 2);
switch (type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_circle_fireballs, {
			fireball: obj_projectile_mini_fireball
		});
		break;
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_line_curve_fireball, {
			fireball: obj_projectile_curve_mini_fireball
		});
		break;
	case 2:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_random_fireballs, {
			fireball: obj_projectile_fireball
		});
		break;
	case 3:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_successive_circles_mini_fireballs, {
		});
		break;
}