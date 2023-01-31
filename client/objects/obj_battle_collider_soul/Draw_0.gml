draw_reset();

var alpha = is_collided ? 1 : (cooldown / cooldown_max);
draw_sprite_ext(spr_batlle_soul_collider, 0, x, y, 1, 1, image_angle, c_white, alpha);

draw_reset();