function object_get_sprite_min_size(object) {
	var sprite = object_get_sprite(object);
	return min(sprite_get_width(sprite), sprite_get_height(sprite));
}