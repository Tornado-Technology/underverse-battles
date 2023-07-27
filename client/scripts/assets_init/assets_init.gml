function assets_load() {
	var assets_directory = working_directory + "Assets/";

	directory_verify(assets_directory);
	logger.info("Assets loading...");
	
	try {
		var assets_dirictorys = file_finde_all("Assets/*", fa_directory);
			
		for (var i = 0; i < array_length(assets_dirictorys); i++) {
			var asset = assets_dirictorys[i];
			asset_load(assets_directory + asset);
			logger.info($"Assets load: \"{asset}\"");
		}
		
		var length = array_length(assets_dirictorys);
		logger.info($"Assets loaded {length}/{length}");
	} catch(error) {
		logger.error($"Assets loaded failed, reasone: {error}");
	}
}
