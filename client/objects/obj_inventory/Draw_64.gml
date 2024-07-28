if (!is_open) exit;

draw_reset();

var width = display_get_gui_width();

// Statistics
var next_position_x = width - position_x - sprite_get_width(spr_fight_ui_action_box) * 4;
var next_position_y = position_y;

draw_set_font(global._font_main_determination);
draw_sprite_ext(spr_fight_ui_action_box, 0, next_position_x, next_position_y, 4, 4, 0, c_white, 1);
next_position_x += 10;
next_position_y += 10;
draw_text(next_position_x, next_position_y, character.name);
next_position_y += 20;
draw_sprite(character.frame, 0, next_position_x, next_position_y);

draw_set_font(global._font_main_mini);
next_position_y += sprite_get_height(character.frame) + 2;
draw_text(next_position_x, next_position_y, $"{text.hp}: {character.hp}/{character.max_hp}");
next_position_y += 10;
draw_text(next_position_x, next_position_y, $"{text.sp}: {character.stamina}/{character.max_stamina}");
next_position_y += 10;
draw_text(next_position_x, next_position_y, $"{text.damage}: {character.damage}");
next_position_y += 10;
draw_text(next_position_x, next_position_y, $"{text.gold}: {money}");

// Inventory
draw_sprite_ext(spr_fight_ui_action_box, 0, position_x, position_y, 4, 6.2, 0, c_white, 1);
ui.draw(position_x + text_padding - 10, position_y + text_padding);