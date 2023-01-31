/// @param id
function fight_set_next_initiative(){
	if (!instance_exists(obj_fight)) return;
	obj_fight.initiative = 1 - obj_fight.initiative;
}
