function fight_update_death() {
	if (!instance_exists(obj_fight)) return;
	with (obj_fight) event_user(1); // Death Update
}