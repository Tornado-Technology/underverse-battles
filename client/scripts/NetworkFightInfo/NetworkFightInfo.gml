/// @param {Struct} data
function NetworkFightInfo(data) constructor {
	self.id = data.id;
	character_id = data.characterId;
	character_skin_id = data.characterSkinId;
	
	username = data.username;
	nickname = data.nickname;
	rating = data.rating;
	type = data.type;
	badge = data.badge;
	
	/// @return {String}
	static get_username = function() {
		return username;
	}
	
	/// @return {String}
	static get_nickname = function() {
		return nickname;
	}
	
	/// @return {Constant.account_type}
	static get_type = function() {
		return type;
	}
	
		/// @return {Real}
	static get_rating = function() {
		return rating;
	}
	
	/// @return {Struct.NetworkRank|undefined}
	static get_rank = function() {
		return rank_get(rating);
	}
	
	/// @return {Constant.badge_id|undefined}
	static get_badge = function() {
		return is(badge) ? badge : undefined;
	}
	
	/// @return {Constant.Color}
	static get_color = function() {
		return get_type() == account_type.developer ? c_rainbow : get_rank().color;
	}
	
	/// @return {Assets.GMObject}
	static get_character = function() {
		return global.characters[character_id, character_skin_id].object;
	}
}
