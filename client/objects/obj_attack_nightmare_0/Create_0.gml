event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(2, 2);
switch (type) {
	case 0 :
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_tentacles, {
			tentacles: obj_tentacles_nightmare
		});
	break;
	case 2 :
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_tentacles_target, {
			bone_explsoin: obj_bone_explsoin_nightmare
		});
	break;
};
