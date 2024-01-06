if (use_gravity_attack) {
	time_source_destroy(time_source_update);
	time_source_destroy(time_source_update_down);
	time_source_destroy(time_source_update_destroy);
}
else {
	time_source_destroy(time_source_update);
	time_source_destroy(time_source_update_up);
	time_source_destroy(time_source_update_down);
	time_source_destroy(time_source_update_destroy);
}

instance_destroy_array(bone_instances);
final_function();