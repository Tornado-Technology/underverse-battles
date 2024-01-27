draw_reset();

if (input_lock) exit;

// Rectangle
draw_set_color(c_black);
draw_rectangle(rec_x1, rec_y1, rec_x2, rec_y2, false);
draw_set_color(c_white);
draw_rectangle(rec_x1, rec_y1, rec_x1 + rec_line_size, rec_y2, false);

// Character shadow
draw_sprite(spr_char_showing_shadow, 0, rec_x1 / 2, 100);

tabs[tab_id].draw();

if (character == undefined) exit;

draw_sprite(character.statistics.idle_animation, character_animation_frame, rec_x1 / 2, 100);

draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);

draw_text_outlined(width / 6, 10, c_white, c_black, text.char_list);
draw_text_outlined(width / 6, 120, c_white, c_black, character.name);

draw_set_font(global._font_main_mini);

if (tab_id == characters_tab.skins) draw_text_outlined(width / 6, 106, c_white, c_black, character.skin_name);
		
draw_set_halign(fa_left);

draw_text_outlined(5, 140, c_white, c_black, character.statistics.description);
draw_text_outlined(5, 155, c_white, c_black, text.hp + ": " + string(character.statistics.hp));
draw_text_outlined(5, 170, c_white, c_black, text.sp + ": " + string(character.statistics.max_stamina));

draw_text_outlined(5, 185, c_white, c_black, text.damage + ": " + string(character.statistics.damage) + (character.statistics.invulnerability ? "" : " (" + text.karma + ")"));

draw_text_outlined(5, 200, c_white, c_black, text.regeneration + ": " + string(character.statistics.stamina_regen) + " " + text.stamines);
draw_text_outlined(5, 220, c_white, c_black, text.creator      + ": " + string(character.statistics.creator));
draw_text_outlined(5, 235, c_white, c_black, text.soundtrack   + ": " + string(character.statistics.soundtrack_name));