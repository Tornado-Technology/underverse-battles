time_source_destroy(time_source_zone);
time_source_destroy(time_source_end);
if(instance_exists(warning)) {
	instance_destroy(warning);	
}