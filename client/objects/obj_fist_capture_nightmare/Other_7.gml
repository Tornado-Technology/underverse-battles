if (sprite_index == release_sprite) {
	sprite_index = hand_sprite;
	logger.debug("hand_sprite")
}

if (sprite_index == grab_sprite) {
	sprite_index = fist_sprite;
	logger.debug("fist_sprite")
}