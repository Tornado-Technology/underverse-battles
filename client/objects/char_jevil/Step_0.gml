if (!instance_exists(obj_fight)) exit;

var state = fight_get_state();

if (state == fight_state.battle) {
	sprite_index = spr_jevil_idle
} else {
	sprite_index = spr_jevil_static;
}

y = wave(ystart - 3, ystart + 3, 2, 0);