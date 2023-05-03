///@arg {Real} player_id
///@arg {Real} y
function fight_move_player_position_y(player_id, _y){
	var player = global.fight_instance.player[player_id];
	player.y += _y;
	return true;
}