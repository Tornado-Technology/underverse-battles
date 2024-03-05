event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = fight_random_integer(0, 0);

switch(type) {
	case 0 :
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bow_arrows, {
			bow : obj_bow_dream,
			arrows : obj_arrows_dream
		});
	break;
	

}