event_inherited();

on_border_created = function () {
	pattern_instance.callback();
};


type = irandom_range(0, 2);
switch (type) {
	case 0 :
	create_border(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		pattern_instance = create_pattern(obj_pattern_arena_blades, {
			blades_swing: obj_blades_dream
		});
	break;
	
	case 1 :
	create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		pattern_instance = create_pattern(obj_pattern_trap_blades, {
			blades_swing: obj_blades_dream
		});
	break;
	
	case 2 :
	create_border(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		pattern_instance = create_pattern(obj_pattern_two_blades, {
			blades_swing: obj_blades_dream
		});	
	break;
}