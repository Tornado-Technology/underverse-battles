///@arg enemy_id
///@arg damage
function fight_draw_damage_number(enemy_id, damage) {
	var defended_enemy = fight_get_enemy(enemy_id);

	var _x = defended_enemy.x;
	var _y = defended_enemy.y
	
	var lettering = noone;
	lettering = instance_create_depth(_x, _y, fight_depth.ui_hight, obj_fight_damage_lettering);
	lettering.damage = damage;
	lettering.draw_damage = true;
}

///@arg enemy_id
///@arg damage
function fight_draw_heal_number(enemy_id, damage) {
	var defended_enemy = fight_get_enemy(enemy_id);

	var _x = defended_enemy.x;
	var _y = defended_enemy.y
	
	var lettering = noone;
	lettering = instance_create_depth(_x, _y, fight_depth.ui_hight, obj_fight_damage_lettering);
	lettering.damage = damage;
	lettering.draw_heal = true;
}

