///@arg player_id
///@arg x
function fight_set_player_position_x(){
	obj_fight.player[argument[0]].x=argument[1];
	return true;
}