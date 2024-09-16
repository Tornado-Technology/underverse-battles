event_inherited();

ball_collision_width = sprite_width - 2;
ball_collision_height = -10;
ball_spawn_height = 16;

punch_direction = 90;
punch_inaccuracy = 25;
punch_speed = random_range(1.3, 2.2);
punch_force = random_range(3, 5);

init_sprite = spr_alphys_volleyball_standing;
standing_sprite = spr_alphys_volleyball_standing;
walking_up_sprite = spr_alphys_volleyball_walking_up;
walking_down_sprite = spr_alphys_volleyball_walking_down;
walking_left_sprite = spr_alphys_volleyball_walking_left;
walking_right_sprite = spr_alphys_volleyball_walking_right;
punch_sprite = spr_alphys_volleyball_punch;