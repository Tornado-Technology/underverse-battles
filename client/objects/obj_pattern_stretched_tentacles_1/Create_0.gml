//Arguments: tentacles, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	shot = true;
	
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};


update = function () {
	
 };

var period = 33 - 2 * _power;
var repeats = 5 + _power * 2;

var out_time= 60 - (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

update_shot = function () {
	var i = irandom(array_length(tentacles_instance));
	
	shot = false;
};


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(shot ? time_source_update_shot : time_source_out_time);
}, [], -1);


time_source_out_time = time_source_create(time_source_game, out_time / 60, time_source_units_seconds, function () {
	shot = true;		
});

time_source_update_shot = time_source_create(time_source_game, 1 / 3, time_source_units_seconds, function (bone_old, bone_new) {
	update_shot();
});


time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});