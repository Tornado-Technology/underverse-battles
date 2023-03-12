sprite_index = noone;
achievements = global.__achievement_list;
achievements_give = global.__achievement_list_buffer;

get_main_char = function(enemy) {
	var parent = object_get_parent(enemy);
	
	if (!object_exists(enemy) || !object_exists(parent) || parent == obj_character) {
		return enemy;
	}
	
	var new_parent = noone;
	
	while (true) {
		new_parent = object_get_parent(parent);
		
		if (!object_exists(new_parent) || new_parent == obj_character) break;
		parent = new_parent;
	}
	
	return parent;
}
