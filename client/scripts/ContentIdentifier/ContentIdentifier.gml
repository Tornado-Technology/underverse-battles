/// @param {String} source
/// @param {String} key
/// @param {Real} index
function ContentIdentifier(source, key, index) constructor {
	self.source = source;
	self.key = key;
	self.index = index;
	
	/// @return {Bool}
	static is_modification_source = function() {
		return self.source != source_offical;
	}
	
	/// @return {Bool}
	static is_offical_source = function() {
		return self.source == source_offical;
	}
	
	/// @param {String} source - The name of the source that we want to check for ownership.
	/// @return {Bool}
	static belong_source = function(source) {
		return self.source == source;
	}
	
	/// @description Returns a string in the format "suource:key".
	/// @param {String} 
	static to_string = function() {
		return string("{0}:{1}", source, key);
	}
}
