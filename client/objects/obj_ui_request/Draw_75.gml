draw_reset();

// Draw
draw_set_alpha(alpha);
draw_sprite_ext(sprite_border, 0, x, y, scale, 1, 0, c_white, 1);

// Text
draw_set_font(global._font_main_determination);
draw_text(x + 10, y - 19, text);

// Buttons
button_accept.draw(x + 40, y + 19);
button_accept.draw(x + 80, y + 19);

// Reset
draw_reset();