/// @param {Struct} data
function NetworkProfile(data) constructor {
	friends = data.friends;
	unlocking_characters = data.unlockingCharacters;
	rating = data.rating;
	gold = data.gold;
	badge = data.badge;
	
	/// @return {Array<String>}
	static get_friends = function() {
		return friends;
	}
	
	/// @return {Array<Real>}
	static get_characters = function() {
		return unlocking_characters;
	}
	
	/// @return {Real}
	static get_rating = function() {
		return rating;
	}
	
	/// @return {Struct.NetworkRank|undefined}
	static get_rank = function() {
		return rank_get(rating);
	}
	
	/// @return {Constant.Color}
	static get_color = function() {
		return network_account_get().type == account_type.developer ? c_rainbow : get_rank().color;
	}
	
	/// @return {Real}
	static get_gold = function() {
		return gold;
	}

	/// @return {Constant.badge_id|undefined}
	static get_badge = function() {
		return is(badge) ? badge : undefined;
	}
}
