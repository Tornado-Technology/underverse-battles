surface_cord = Vector2(25,  110);
surface_size = Vector2(430, 120);
surface = surface_create(surface_size.x, surface_size.y);

character_name[0] = obj_fight.enemy[0].name;
character_name[1] = obj_fight.enemy[1].name;
character_attack[0, 0] = obj_fight.enemy[0].actions[0].name;
character_attack[0, 1] = obj_fight.enemy[0].actions[1].name;
character_attack[0, 2] = obj_fight.enemy[0].actions[2].name;
character_attack[1, 0] = obj_fight.enemy[1].actions[0].name;
character_attack[1, 1] = obj_fight.enemy[1].actions[1].name;
character_attack[1, 2] = obj_fight.enemy[1].actions[2].name;
selection_attacks_0 = [];
selection_attacks_1 = [];
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
	up: UIImageButton(spr_stat_arrow, function() {
		scroll_up();
	}),
	down: UIImageButton(spr_stat_arrow, function() {
		scroll_down();
	})
}

var elements = variable_struct_get_names(arrows);
for (var i = 0; i < array_length(elements); i++) {
	var arrow = arrows[$ elements[i]];
	arrow.on_held = arrow.callback;
}

scroll_up = function(coef = 1) {
	if (shift > 0) {
		shift -= 4 * coef;
	}
}

scroll_down = function(coef = 1) {
	if (shift < array_length(selection_attacks_0) * 20 - 120) {
		shift += 4 * coef;
	}
}
