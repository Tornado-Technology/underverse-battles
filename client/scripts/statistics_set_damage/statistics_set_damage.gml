function statistics_set_damage(damage){
	if (!instance_exists(obj_statistics))
		exit;
	array_push(obj_statistics.getting_damage, damage);
}