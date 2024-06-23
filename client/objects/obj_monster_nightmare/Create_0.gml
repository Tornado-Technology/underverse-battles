event_inherited();

disable_surface = true;

speed_const = 1;
damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

spwan_bullets = function () {	
	var thorns = instance_create_depth(obj_battle_soul.x, y  + irandom_range(2, 20), fight_depth.bullet_outside_hight, obj_bullets_nightmare);	 
	thorns.speed_const = 2;
	thorns.direction = 270;
}

time_source_spwan_bullets = time_source_create(time_source_game,  30 / 60, time_source_units_seconds, function () {
	spwan_bullets();	
	time_source_start(time_source_out_time_spwan);
});

time_source_out_time_spwan = time_source_create(time_source_game, 40 / 60, time_source_units_frames, function () {
	time_source_start(time_source_spwan_bullets);	
})

time_source_start(time_source_spwan_bullets);