if (ds_map_find_value(async_load, "status")) {
	on_data.invoke_for_array(ds_map_find_value(async_load, "result"), ds_map_find_value(async_load, "id"));
}