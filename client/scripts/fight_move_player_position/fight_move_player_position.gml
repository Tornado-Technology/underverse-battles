///@arg {Real} player_id
///@arg {Real} x
///@arg {Real} y
function fight_move_player_position(player_id, _x, _y){
	var player = global.fight_instance.player[player_id];
	player.x += _x;
	player.y += _y;
	return true;
}