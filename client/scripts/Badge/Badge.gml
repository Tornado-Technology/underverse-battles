enum badge_id {
	moderator,
	sponsor,
	observer,
	megalomaniac,
	youtuber,
	beta_tester,
	winter_2022,
}

/// @param {Real} index
/// @param {String} key
/// @param {Asset.GMSprite} sprite
function Badge(index, key, sprite) constructor {
	self.index = index;
	self.key = key;
	self.sprite = sprite;
}
