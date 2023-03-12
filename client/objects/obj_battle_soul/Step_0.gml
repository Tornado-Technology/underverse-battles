/// @desc Movement & Inv
if (follow_board) {
	x += obj_battle_border.x - obj_battle_border.xprevious;
	y += obj_battle_border.y - obj_battle_border.yprevious;
}

invincibility_update();
tremble_update();

ability = global.fight_instance.required_components.input.input_ability;