function Dictionary() constructor {
	self.__list = [];
	
	/// @param {Any} key
	/// @param {Any} value
	static add = function(key, value) {
		array_push(__list, new KeyValuePair(key, value));
	}

	/// @param {Any} value
	/// @return {Any}
	static get_key = function(value) {
		return get_pair_by_value(value).key;
	}
	
	/// @param {Any} key
	/// @return {Any}
	static get_value = function(key) {
		return get_pair_by_key(key).value;
	}
	
	/// @param {Any} key
	/// @return {Struct.KeyPairValue}
	static get_pair_by_key = function(key) {
		var index = __get_key_index(key);
		return __list[index];
	}
	
	/// @param {Any} value
	/// @return {Struct.KeyPairValue}
	static get_pair_by_value = function(value) {
		var index = __get_value_index(value);
		return __list[index];
	}
	
	/// @param {Any} key
	static remove_by_key = function(key) {
		var index = __get_key_index(key);
		array_delete(list, index, 1);
	}
	
	/// @param {Any} value
	static remove_by_value = function(value) {
		var index = __get_value_index(value);
		array_delete(list, index, 1);;
	}
	
	/// @return {Array<Struct.KeyValuePair>}
	static get_list = function() {
		return __list;
	}

	
	static clear = function() {
		array_clear(__keys);
		array_clear(__values);
	}
	
	/// @return {Real}
	static get_length = function() {
		return array_length(__list);
	}
	
	/// @param {Struct.Dictionary} dictionary
	/// @return {Bool}
	static equals = function(dictionary) {
		return array_equals(__list, dictionary.get_list());
	}
	
	/// @param {Any} value
	/// @return {Real}
	static __get_value_index = function(value) {
		return array_find_index(__list, function(e, i) {
			return e.value == value;
		});
	}
	
	/// @param {Any} key
	/// @return {Real}
	static __get_key_index = function(key) {
		return array_find_index(__list, function(e, i) {
			return e.key == key;
		});
	}
}
