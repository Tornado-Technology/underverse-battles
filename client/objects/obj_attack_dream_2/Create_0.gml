event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};

switch(type) {
	case 0:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bow_arrows, {
			bow: obj_bow_dream,
			arrows: obj_arrow_dream
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_bow_blades, {
			bow: obj_bow_dream,
			arrows: obj_arrow_dream,
			blades: obj_blade_moving_parabolas_dream
		});
	break;
	
	
	default:
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 10, battle_border.right + 10);
		pattern_instance = create_pattern(obj_pattern_bow_orange_star, {
			bow: obj_bow_dream,
			arrows: obj_arrow_dream,
			arrows_orange: obj_arrow_orange_dream
		});	
	break;
}