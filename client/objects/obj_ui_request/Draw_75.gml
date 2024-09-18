draw_reset();

// Draw
draw_set_alpha(alpha);
draw_sprite_ext(sprite_border, 0, x, y, scale, 1, 0, c_white, alpha);

// Text
draw_set_font(global._font_main_determination);
draw_text(x + shift_x, y - shift_y, text);

// Buttons
selector.draw(0, x + sprite_border_width / 2 - 40, y + shift_y);
selector.draw(1, x + sprite_border_width / 2 + 40, y + shift_y);

// Reset
draw_reset();