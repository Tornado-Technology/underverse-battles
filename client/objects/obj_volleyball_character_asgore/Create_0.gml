event_inherited();

ball_collision_width = sprite_width - 5;
ball_collision_height = -12;
ball_spawn_height = 70;

trigger_distance = 70;

punch_direction = 90;
punch_inaccuracy = 6;
punch_speed = random_range(1.6, 2.2);
punch_force = random_range(4, 5);

init_sprite = spr_asgore_volleyball_standing;
standing_sprite = spr_asgore_volleyball_standing;
walking_up_sprite = spr_asgore_volleyball_walking_up;
walking_down_sprite = spr_asgore_volleyball_walking_down;
walking_left_sprite = spr_asgore_volleyball_walking_left;
walking_right_sprite = spr_asgore_volleyball_walking_right;
punch_sprite = spr_asgore_volleyball_punch;