event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch (type) {
	case 0:
		create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_arena_cutting, {
			knife_swing: obj_knife_swing
		});
		break;
	case 1:
		create_border(battle_border.up - 45, battle_border.down - 45, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_rotating_big_knife, {
			big_knife: obj_big_knife_cross_event
		});
		break;
	default:
		create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_big_knife_pokes, {
			big_knife: obj_big_knife_cross_event,
			bone: obj_bone_cross_xevent
		});
		break;
}