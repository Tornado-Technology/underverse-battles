function statistics_set_damage(dam){
	if (instance_exists(obj_statistics)) {
		obj_statistics.getting_damage[array_length(obj_statistics.getting_damage)] = dam;
		return true;
	}
	return false;
}