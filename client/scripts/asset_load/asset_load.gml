function asset_load(path) {
	var soundtracks_path = path + "/soundtracks/";
	var soundtracks_data = file_finde_all(soundtracks_path + "*.json", 0);	
	
	for (var i = 0; i < array_length(soundtracks_data); i++) {
		var soundrack_json = json_open(soundtracks_path + soundtracks_data[i]);
		var name = "[Mod]" + soundrack_json.name;
		var desc = soundrack_json.desc;
		var author = soundrack_json.author;
		var au = soundrack_json.au;
		Soundtrack(undefined, name, author, desc, au, true, soundtracks_path + soundrack_json.file);
	}
}
