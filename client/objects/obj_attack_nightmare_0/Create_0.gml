event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = fight_random_integer(1, 1);
switch (type) {
	case 0 :
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_tentacles, {
			tentacles: obj_tentacles_nightmare
		});
	break;
	case 1 :
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_tentacles_three_and_gasterblaset, {
			thread_tentacles : obj_thread_tentacles_nightmare,
			gasterblaster_aiming : obj_gasterblaster_aiming_nightmare
		})
	break;
	

};
