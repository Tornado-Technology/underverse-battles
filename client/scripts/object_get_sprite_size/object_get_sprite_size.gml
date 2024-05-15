function object_get_sprite_size(object) {
	var sprite = object_get_sprite(object);
	return new Vector2(sprite_get_width(sprite), sprite_get_height(sprite));
}