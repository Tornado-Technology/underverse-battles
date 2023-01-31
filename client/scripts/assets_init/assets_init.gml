function assets_load() {
	var assets_directory = working_directory + "Assets/";

	directory_verify(assets_directory);
	logger.info("Assets loading...");
	
	try {
		var assets_dirictorys = file_finde_all("Assets/*", fa_directory);
			
		for (var i = 0; i < array_length(assets_dirictorys); i++) {
			var asset = assets_dirictorys[i];
			asset_load(assets_directory + asset);
			logger.info("Assets load: \"{0}\".", asset);
		}
			
		logger.info("Assets loaded {0}/{0}.", array_length(assets_dirictorys));
	} catch(error) {
		logger.error("Assets loaded failed, reasone: {0}.", error)
	}
}
