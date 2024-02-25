event_inherited();
scale_const = 0;
new_counst = 0;

end_counst = -1;
end_time = 0.3;

back_counst = false; 
back = false;
back_time = 0.09;

change_scale = function(scale_new = scale_const, step, end_step) {
	scale_time = step;
	end_time = end_step;
	new_counst = scale_new;
};



time_source_destroy_self = time_source_create(time_source_game, 29 / 60, time_source_units_seconds, function () {
	instance_destroy();	
})