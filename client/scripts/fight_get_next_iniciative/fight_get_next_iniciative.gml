function fight_get_next_initiative(){
	if (!instance_exists(obj_fight)) return -1;
	return 1 - obj_fight.initiative;
}