function fight_draw_dodge() {
	var defended_player = fight_get_player(fight_get_next_initiative());

	var _x = defended_player.x;
	var _y = defended_player.y
	
	var lettering = instance_create_depth(_x, _y, fight_depth.ui_hight, obj_fight_damage_lettering);
	lettering.draw_dodge = true;
}