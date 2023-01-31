/// @param {String} key
/// @param {Asset.GMSprite} icon
/// @param {Bool} hide
/// @retrun {Struct}
function Achievement(key, icon, hide = false) {
	var index = achievement_list_length;
	var achiviment = new AchievementClass(index, key, icon, hide);
	var list = global.__achievement_list;
	array_push(list, achiviment);
}

/// @param {Real} index
/// @param {String} key
/// @param {Asset.GMSprite} icon
/// @param {Bool} hide
function AchievementClass(index, key, icon, hide) constructor {
	index = 0;
	
	self.icon = icon;
	self.key = key;
	self.hide = hide;
	
	name = "";
	description = "";
	
	is_taken = false;

	static translate_update = function() {
		var directory = "Achievements.";
		name = translate_get(directory + key + ".Name");
		description = translate_get(directory + key + ".Description");
	} 
}
