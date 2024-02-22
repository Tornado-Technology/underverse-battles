event_inherited();

var player_id = 0;
var player = fight_get_player(player_id);

draw_set_color(c_white);
draw_set_font(font_console_mini);
draw_text(player.x, player.y - player.sprite_height - 10, $"Attack type: {global.fight_instance.type}");
draw_text(player.x, player.y - player.sprite_height - 18, $"Skin ID: {global.fight_instance.selected_skin}");
draw_text(player.x, player.y - player.sprite_height - 26, $"Character ID: {global.fight_instance.selected_character}");

draw_reset();