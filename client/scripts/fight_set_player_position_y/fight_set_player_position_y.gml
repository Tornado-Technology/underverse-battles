///@arg {Real} player_id
///@arg {Real} x
function fight_set_player_position_y(player_id, _y){
	global.fight_instance.player[player_id].y = _y;
	return true;
}