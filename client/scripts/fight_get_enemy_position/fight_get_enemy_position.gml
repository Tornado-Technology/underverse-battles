///@arg enemy_id
function fight_get_enemy_position(){
	var ENEMY=obj_fight.enemy[argument[0]];
	return [ENEMY.x,ENEMY.y];
}