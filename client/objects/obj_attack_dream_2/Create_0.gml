event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

type = irandom_range(2, 2);

switch(type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bow_arrows, {
			bow: obj_bow_dream,
			arrows: obj_arrows_dream
		});
	break;
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bow_cross, {
				bow: obj_bow_dream,
				arrows: obj_arrows_spwan_star_dream
			});
	break;
	case 2:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bow_4, {
				bow: obj_bow_dream,
				arrows: obj_arrows_dream,
				arrows_star: obj_arrows_spwan_star_dream,
				arrows_orange: obj_arrows_orange_dream,
				arrows_orange_star: obj_arrows_orange_spwan_star_dream
			});	
	break;

}