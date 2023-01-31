///@arg enemy_id
///@arg y
function fight_move_enemy_position_y(){
	obj_fight.enemy[argument[0]].y+=argument[1];
	return true;
}