///@arg enemy_id
function fight_flip_enemy(){
	fight_get_enemy(argument[0]).image_xscale*=-1;
	return true;
}