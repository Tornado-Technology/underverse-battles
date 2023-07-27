/// @param {String} key
/// @param {Constant.Color} color
/// @param {Real} min_value
/// @param {Real} max_value
function NetworkRank(key, color, min_value, max_value) constructor {
	static translate_path = "Menu.Statistics.RankType";
	
	self.key = key;
	self.color = color;
	self.min_value = min_value;
	self.max_value = max_value;
	
	/// @return {String}
	static get_name = function() {
		return translate_get($"{translate_path}.{key}");
	}
	
	/// @return {Constant.Color}
	static get_color = function() {
		return color;
	}
	
	/// @param {Real} rating
	/// @return {Bool}
	static belongs = function(rating) {
		return rating >= min_value && rating <= max_value;
	}
}