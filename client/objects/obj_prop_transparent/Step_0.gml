depth = -y;

image_alpha = approach(image_alpha, target_alpha, 0.02);

if (!instance_exists(target_character)) exit;

if (transparent_position == y && target_character.y - target_character.sprite_height < transparent_position ||
	transparent_position == x && target_character.x - target_character.sprite_width / 2 < transparent_position) {
	target_alpha = 0;
}
else {
	target_alpha = 1;
}