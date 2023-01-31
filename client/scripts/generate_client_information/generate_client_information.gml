function generate_client_information() {
	var info = {
		version: game_version,
		build: game_build,
		os_type: os_type,
		os_name: os_get_name(os_type),
		os_version: os_version,
		os_info: json_encode(os_get_info()),
		os_language: os_get_language(),
		os_region: os_get_region(),
		config: os_get_config(),
		hash: undefined
	}

	var executable_path = program_directory + "/UnderverseBattles.exe";
	var data_path = program_directory + "/data.win";
	if (file_exists(executable_path) && file_exists(data_path)) {
		var buffer_hash = buffer_create(1, buffer_grow, buffer_string);
		buffer_write(buffer_hash, buffer_string, directory_get_hash(executable_path));
		buffer_write(buffer_hash, buffer_string, directory_get_hash(data_path));
		info.hash = buffer_sha1(buffer_hash, 0, buffer_get_size(buffer_hash));
		buffer_delete(buffer_hash);
	}
 
	return info;
}

global.__client_information = generate_client_information();
#macro client_info global.__client_information
