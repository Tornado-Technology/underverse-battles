///@arg {Real} player_id
///@arg {Real} x
function fight_move_player_position_x(player_id, _x){
	var player = global.fight_instance.player[player_id];
	player.x += _x;
	return true;
}