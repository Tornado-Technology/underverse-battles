///@arg {Real} player_id
///@arg {Real} x
function fight_set_player_position_x(player_id, _x){
	global.fight_instance.player[player_id].x = _x;
	return true;
}