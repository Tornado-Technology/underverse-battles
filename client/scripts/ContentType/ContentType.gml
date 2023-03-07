function ContentType() constructor {
	self.index = undefined;
	self.dictionary = new Dictionary();
	
	/// @param {Any} content
	/// @parma {Struct.ContentIdentifier} indentifer
	static add = function(content, indentifer) {
		dictionary.add(indentifer, content);
	}
	
	/// @param {Any} content
	/// @param {String} key
	/// @param {Real} index
	static add_offical = function(content, key, index) {
		dictionary.add(new ContentIdentifier(source_offical, key, index), content);
	}
	
	/// @param {Struct.ContentIdentifier} indentifer
	static get = function(indentifer) { 
		return dictionary.get_value(indentifer);
	}
	
	/// @param {Real} index
	/// @return {Any}
	static get_by_index = function(index) {
		var indentifer = array_find(dictionary.get_list(), function(e, i) {
			return e.key.index == index;
		});
		return dictionary.get_value(indentifer);
	}
	
	/// @param {String} key
	/// @return {Any}
	static get_by_key = function(key) {
		var indentifer = array_find(dictionary.get_list(), function(e, i) {
			return e.key.key == key;
		});
		return dictionary.get_value(indentifer);
	}

	/// @param {Any} content
	/// @return {Bool}
	static validate = function(content) {
		logger.fatal("Unrealized abstract method of the `ContentType` constructor");
		return false;
	}
}
