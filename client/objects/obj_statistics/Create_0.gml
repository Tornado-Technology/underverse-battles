surface_cord = new Vector2(25,  110);
surface_size = new Vector2(430, 120);
surface = surface_create(surface_size.x, surface_size.y);

action_list_size = 0;

character_name[0] = obj_fight.player[0].name;
character_name[1] = obj_fight.player[1].name;
character_attack[0, 0] = obj_fight.player[0].actions[0].name;
character_attack[0, 1] = obj_fight.player[0].actions[1].name;
character_attack[0, 2] = obj_fight.player[0].actions[2].name;
character_attack[1, 0] = obj_fight.player[1].actions[0].name;
character_attack[1, 1] = obj_fight.player[1].actions[1].name;
character_attack[1, 2] = obj_fight.player[1].actions[2].name;
character_special_attack[0] = obj_fight.player[0].special_action.name;
character_special_attack[1] = obj_fight.player[1].special_action.name;
selected_action = [];
initiative = [];
getting_damage = [];

shift = 0;

is_winner = -1;
rating = 0;

lang_skip  = translate_get("Battle.Skip");
lang_dodge = translate_get("Battle.Dodge");
lang_miss  = translate_get("Battle.Miss");
string_rp = translate_get("Gameover.RatingPoint");

arrows = {
	up: new UIImageButton(0, spr_ui_arrow)
		.set_padding(5)
		.set_on_held(function() {
			scroll_up(3);
		}),
	down: new UIImageButton(1, spr_ui_arrow)
		.set_padding(5)
		.set_on_held(function() {
			scroll_down(3);
		})
}

scroll_up = function(coef = 1) {
	if (shift > 0) {
		shift -= 4 * coef;
	}
}

scroll_down = function(coef = 1) {
	if (shift < action_list_size * 20 - 120) {
		shift += 4 * coef;
	}
}

draw_selected_action = function(text_x, text_y, text, player_id, action_type, step) {
	if (array_length(selected_action[player_id]) > step)
		if (selected_action[player_id, step] == action_type)
			draw_text(text_x, text_y, text);
}
