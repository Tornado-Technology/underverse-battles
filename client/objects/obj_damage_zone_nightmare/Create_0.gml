event_inherited();


on_soul_touch = function (soul) {
	
	fight_soul_damage(damage, destructible, id);
	fight_player_heal(fight_get_initiative(), damage);
	soul_start_tremble(soul);	
	instance_destroy();
}


depth = fight_depth.bullet_outside;

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

image_xscale = 0;
image_yscale = 0;

warning = noone;

//Time sources
time_source_zone = time_source_create(time_source_game, 1/3, time_source_units_seconds, function () {
	instance_destroy(warning);
	time_source_start(time_source_end);
});
time_source_end = time_source_create(time_source_game, 1/3, time_source_units_seconds, function () {
	instance_destroy();
});

time_source_start(time_source_zone);