global.network_fight_object_storage = id;

size = 3;
instances = [];
current_index = 0;

repeat(size) {
	array_push(instances, ds_map_create());
}

push = function(storage_index, instance) {
	ds_map_add(instances[storage_index], current_index, instance);
	current_index++;
}

replace = function(storage_index, instance, index) {
	ds_map_replace(instances[storage_index], [index], instance);
}

clear = function(storage_index) {
	var array = ds_map_values_to_array(instances[storage_index]);
	instance_destroy_array(array);
	ds_map_clear(instances[storage_index]);
	current_index = 0;
}

clear_by_edit = function(storage_index, color, count, distance) {
	var array = ds_map_values_to_array(instances[storage_index]);
	var i = 0;
	repeat(array_length(array)) {
		destroy_by_edit(instances[storage_index][i], color, count, distance);
		i++;
	}
	ds_map_clear(instances[storage_index]);
	current_index = 0;
}