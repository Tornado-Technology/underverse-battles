global.__assets_avaible = true;
global.__assets_list = [];

#macro assets_avaible global.__assets_avaible
#macro assets_list global.__assets_list
#macro assets_list_count array_length(assets_list)

/// @param {String} index
function Asset(index) : Modification(index) constructor {
    path = "";
  	config = undefined;
	
	static load = function() {
	
	}
	

	static unload = function() {
	
	}

	static erase = function() {
		if (!directory_exists(path)) {
			logger.alert($"Asset \"{index}\" erase failed, reasone: Path \"{path}\" not exists.");
			return;
		}
		
		directory_destroy(get_full_path());
	}
	
	static get_full_path = function() {
		return game_save_id + path;
	}
}

function asset_add() {
	
}