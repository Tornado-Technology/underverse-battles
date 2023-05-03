///@arg {Real} player_id
function fight_flip_player(player_id){
	fight_get_player(player_id).image_xscale*=-1;
	return true;
}