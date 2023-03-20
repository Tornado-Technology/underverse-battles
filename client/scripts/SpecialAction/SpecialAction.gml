/// @param {String} key
/// @param {Asset.GMSprite} icon
/// @param {Function} callback
/// @param {Real} percent_given
/// @return {Struct.SpecialActionClass}
function SpecialAction(key, icon, callback = undefined, percent_given = 2, is_damage_attack = true) {
	var action = new SpecialActionClass(key + ".Name", key + ".Description", icon, callback, percent_given, is_damage_attack);
	action.init();
	return action;
}

/// @param {String} key_name
/// @param {String} key_description
/// @param {Asset.GMSprite} icon
/// @param {Function} callback
/// @param {Number} percent_given
function SpecialActionClass(key_name, key_description, icon, callback, percent_given, is_damage_attack) constructor {
	self.key_name = key_name;
	self.key_description = key_description;
	self.percent = 0;
	self.percent_given = percent_given;
	self.is_damage_attack = is_damage_attack;
	self.icon = icon;
	self.callback = callback;
	
	name = "";
	description = "";
	
	static init = function() {
		name = translate_get(key_name);
		description = translate_get(key_description);
	}
	
	/// @param {Id.Instance} character
	static invoke = function(character) {
		if (callback == undefined) return;
		callback(character);
	}
}
