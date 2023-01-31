function fight_draw_dodge() {
	var defended_enemy = fight_get_enemy(fight_get_next_initiative());

	var _x = defended_enemy.x;
	var _y = defended_enemy.y
	
	var lettering = instance_create_depth(_x, _y, fight_depth.ui_hight, obj_fight_damage_lettering);
	lettering.draw_dodge = true;
}