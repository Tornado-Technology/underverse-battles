event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};	

switch (type) {
	case 0:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_poking_tentacles, {
			tentacles: obj_tentacle_nightmare_mecha
		});
	break;
	
	case 1:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left  + 10, battle_border.right  + 10);
		pattern_instance = create_pattern(obj_pattern_tentacles_from_up_down, {
			tentacles: obj_tentacle_destroy_back_nightmare_mecha
		});
	break;
	
	
default:
		create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_tentacles_explosion, {
			bomb: obj_bomb_tentacles_nightmare
		});
	break;
	

};
