///@arg enemy_id
///@arg x
function fight_move_enemy_position_x(){
	obj_fight.enemy[argument[0]].x+=argument[1];
	return true;
}