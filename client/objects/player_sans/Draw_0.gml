/* Draw reset */
draw_reset();

/* Draw shadow */
if (draw_shadow) draw_sprite(spr_char_sans_walk_shadow, 0, x, y);

/* Draw self */
draw_self();