if (!is_open) exit;

draw_sprite_ext(spr_fight_ui_action_box, 0, position_x, position_y, 4, 6.2, 0, c_white, 1);
ui.draw(position_x + text_padding - 10, position_y + text_padding);