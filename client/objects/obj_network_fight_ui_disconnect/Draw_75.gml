if (fight_get_state() == fight_state.wait) exit;

var width = display_get_gui_width();
var height = display_get_gui_height();

draw_reset();
draw_set_color(blackout_color);
draw_set_alpha(blackout_alpha);
draw_rectangle(0, 0, width, height, false);

draw_reset();

draw_set_font(font_determination)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outlined(width / 2, height / 2, c_white, c_black, translate_get("Battle.DisconnectedFromTheBattle"));
draw_text_outlined(width / 2, height / 2 + 20,  c_white, c_black, translate_get("Battle.AttemptingToReconnect"));

//draw_sprite_ext(obj_bone_rotating_swap_sans, 0, width / 2, height / 2 + 40, 2, 2, spinner_angle, c_white, 1);
draw_sprite_ext(spr_bone_rotating_swap_sans, 0, width / 2, height / 2 + 50, 1, 2, spinner_angle, c_white, 1);

draw_text_outlined(width / 2, height / 2 + 80,  c_white, c_black, time_to_ms(time));
draw_reset();
