event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(4, 4);
switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_tentacles, {
			tentacles: obj_tentacles_nightmare
		});
	break;
	
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left  + 21, battle_border.right  + 21);
		pattern_instance = create_pattern(obj_pattern_tentacles_changes, {
			tentacles: obj_tentacles_back_nightmare
		});
	break;
	
	case 2:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_tentacles_explosion, {
			bomb: obj_bomb_tentacles_nightmare
		});
	break;
	
	case 3: 
		create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_pattern_tentacles_slime, {
			bomb: obj_bomb_bone_nightmare,
			slime: obj_slime_nightmare
		});
	break;
	
	case 4:
		create_border(battle_border.up , battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_tentacles_three, {
			thread_tentacles: obj_string_tentacles_nightmare,
			spike: obj_spike_1_nightmare
		});	
	break; 
	
	
};
