/// @param {String} key
/// @param {Real} type
/// @param {Function} callabck
/// @return {Struct.ActionClass}
function Action(key, type, callback = undefined) {
	var action = new ActionClass("Attacks." + key, "AttacksDescription." + key, type, callback);
	action.init();
	return action;
}

/// @param {String} name_key
/// @param {String} desc_key
/// @param {Real} type
/// @param {Function} callabck
function ActionClass(name_key, desc_key, type, callback) constructor {
	self.name_key = name_key;
	self.desc_key = desc_key;
	self.type = type;
	self.callback = callback;
	
	name = "";
	desc = "";
	
	static init = function() {
		name = translate_get(name_key);
		desc = translate_get(desc_key);
	}
	
	/// @param {Id.Instance} character
	/// @param {Real} power
	static invoke = function(character, pow) {
		if (callback == undefined) {
			return;
		}
		
		callback(pow, character);
	}
}

function Cost() {
	var arr = [];
	for (var i = 0; i < argument_count; i++) {
		array_push(arr, real(argument[i]));	
	}
	return arr;
}
