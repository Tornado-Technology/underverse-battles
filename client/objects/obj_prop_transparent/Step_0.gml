depth = -y;

image_alpha = approach(image_alpha, target_alpha, 0.02);

if (target_character.y - target_character.sprite_height < transparent_position) {
	target_alpha = 0;
}
else {
	target_alpha = 1;
}