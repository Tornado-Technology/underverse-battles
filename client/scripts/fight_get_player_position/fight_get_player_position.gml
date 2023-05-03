///@arg player_id
function fight_get_player_position(player_id) {
	var player = global.fight_instance.player[player_id];
	return [player.x,player.y];
}