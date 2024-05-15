function object_get_sprite_max_size(object) {
	var sprite = object_get_sprite(object);
	return max(sprite_get_width(sprite), sprite_get_height(sprite));
}