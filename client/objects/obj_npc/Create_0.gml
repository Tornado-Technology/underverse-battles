image_speed = 0;

speak = function() {
	image_speed = 1;
}

stop_speaking = function() {
	image_index = 0;
	image_speed = 0;
}

change_sprite_to_other_sprite = function(previous_sprite, new_sprite) {
	if (sprite_index == previous_sprite)
		sprite_index = new_sprite;
}