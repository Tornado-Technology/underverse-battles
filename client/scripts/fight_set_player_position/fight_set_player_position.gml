///@arg player_id
///@arg x
///@arg y
function fight_set_player_position(){
	var player=obj_fight.player[argument[0]];
	player.x=argument[1];
	player.y=argument[2];
	return true;
}