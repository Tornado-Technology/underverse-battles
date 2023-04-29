///@arg player_id
///@arg y
function fight_set_player_position_y(){
	obj_fight.player[argument[0]].y=argument[1];
	return true;
}