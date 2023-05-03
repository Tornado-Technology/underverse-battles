///@arg player_id
function fight_flip_player(){
	fight_get_player(argument[0]).image_xscale*=-1;
	return true;
}