event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_nightmare);
pusher = 10;

soul_invulnerability = 20;

index_sprite = sprite_get_number(sprite_index) - 1;

sprite_fram = 0;

step = 1;

smooth_move = false;

direction = image_angle;

smooth_y = function (_y) {
	smooth_move = true;
	position_y = _y;
}


destroying = false;
