///@arg player_id
///@arg damage
function fight_draw_damage_number(player_id, damage) {
	var defended_player = fight_get_player(player_id);

	var _x = defended_player.x;
	var _y = defended_player.y
	
	var lettering = noone;
	lettering = instance_create_depth(_x, _y, fight_depth.ui_hight, obj_fight_damage_lettering);
	lettering.damage = damage;
	lettering.draw_damage = true;
}

///@arg player_id
///@arg damage
function fight_draw_heal_number(player_id, damage) {
	var defended_player = fight_get_player(player_id);

	var _x = defended_player.x;
	var _y = defended_player.y
	
	var lettering = noone;
	lettering = instance_create_depth(_x, _y, fight_depth.ui_hight, obj_fight_damage_lettering);
	lettering.damage = damage;
	lettering.draw_heal = true;
}

