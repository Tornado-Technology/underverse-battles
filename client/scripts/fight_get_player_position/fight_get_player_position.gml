///@arg player_id
function fight_get_player_position(){
	var player=obj_fight.player[argument[0]];
	return [player.x,player.y];
}