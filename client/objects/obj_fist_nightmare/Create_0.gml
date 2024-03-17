event_inherited();

damage = get_char_damage(obj_character_nightmare);
pusher = 10;

direction_fist = !image_angle ?  pusher : -pusher;

destroy = false;

outside_force_speed =  direction_fist + speed_count * dtime;
