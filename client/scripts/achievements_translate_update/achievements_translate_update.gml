function achievements_translate_update() {
	var size = achievement_list_length;
	var list = global.__achievement_list;
	
	for (var i = 0; i < size; i++) {
		list[i].translate_update();
	}
}

