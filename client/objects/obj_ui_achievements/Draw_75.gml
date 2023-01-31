draw_reset();

// Draw
draw_set_alpha(alpha);
draw_sprite(achievement.icon, 0, x, y);
draw_sprite_ext(sprite_border, 0, x, y, scale, 1, 0, c_white, 1);

// Settings
draw_set_font(font_determination);
draw_set_halign(fa_right);
draw_set_alpha(alpha_text);

// Text
draw_text(x - 50, y - 19, text);

// Reset
draw_reset();