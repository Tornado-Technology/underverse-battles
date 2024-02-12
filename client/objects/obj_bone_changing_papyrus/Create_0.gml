event_inherited();

damage = 1;

depth = fight_depth.bullet_outside_hight;

changing = true;
call_back_star = false;
repeat_finish = false;
_repeat = false;

soul_invulnerability = 20;

time_back = 0;
time_repeat_star = 0;

call_repeat_all = function () {
	_repeat = true;
}

time_source_back_changing = time_source_create(time_source_game, time_back / 60, time_source_units_seconds, function () {
	changing = true;	
})

time_source_repeat_star = time_source_create(time_source_game, time_repeat_star / 60, time_source_units_seconds, function () {
image_yscale = approach(image_yscale, star_yscale, 0.1);

})