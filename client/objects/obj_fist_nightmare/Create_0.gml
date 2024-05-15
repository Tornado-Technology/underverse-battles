event_inherited();

damage = get_char_damage(obj_character_nightmare);
pusher = 10;

soul_invulnerability = 20;

index_sprite = sprite_get_number(sprite_index) - 1;

direction_fist = !image_angle ?  pusher : -pusher;

destroy = false;

outside_force_speed =  direction_fist + speed_count * dtime;
draw_no_in_arena = false;