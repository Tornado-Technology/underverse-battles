/// @description Reference to IProfile (server/src/database/schemas/profile.ts)
function NetworkProfile() constructor {
	friends = [];
	unlocking_characters = [];
	rating = 0;
	gold = 0;
	badge = undefined;
	
	/// @param {Struct} data
	static set = function(data) {
		try {
			friends = data.friends;
			unlocking_characters = data.unlockingCharacters;
			rating = data.rating;
			gold = data.gold;
			badge = data.badge;
		} catch (exception) {
			throw new StructIndentityException(new NetworkProfile(), data);
		}
		
		return self;
	}
	
	/// @return {Array<String>}
	static get_friends = function() {
		return friends;
	}
	
	/// @return {Array<Constant.character_id>}
	static get_unlocking_characters = function() {
		return unlocking_characters;
	}
	
	/// @return {Real}
	static get_rating = function() {
		return rating;
	}
	
	/// @return {Real}
	static get_gold = function() {
		return gold;
	}
	
	/// @return {Undefined|Constant.badge_id}
	static get_badge = function() {
		return is(badge) ? badge : undefined;
	}
	
	/// @return {Struct.NetworkRank|undefined}
	static get_rank = function() {
		return rank_get(rating);
	}
}
