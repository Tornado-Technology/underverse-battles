event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch(type) {
	case 0:
		create_border(battle_border.up - 10 - _power * 5, battle_border.down - 10 - _power * 5, battle_border.left - 10, battle_border.right - 10);
		pattern_instance = create_pattern(obj_pattern_falling_scythe, {
			scythe_falling: obj_scythe_falling_jevil
		});
	break;
	
	case 1:
		create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_scythe_circle, {
			scythe: obj_scythe_jevil
		});
	break;

	default:
		create_border(battle_border.up, battle_border.down, battle_border.left + 20, battle_border.right + 20);
		pattern_instance = create_pattern(obj_pattern_scythe_small_box, {
			box: obj_box_jevil,
			sprite_spades_box: spr_jevil_spades_box,
			sprite_clubs_box: spr_jevil_clubs_box,
			scythe: obj_turning_scythe_jevil
		})
	break;
	
}