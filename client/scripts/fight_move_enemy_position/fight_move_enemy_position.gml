///@arg enemy_id
///@arg x
///@arg y
function fight_move_enemy_position(){
	var ENEMY=obj_fight.enemy[argument[0]];
	ENEMY.x+=argument[1];
	ENEMY.y+=argument[2];
	return true;
}