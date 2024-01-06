// Arguments arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

update = function () {
	repeat (10) {
		var arrows = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside, arrow, {
		border_instance : border_instance,
		_power : _power
		});	
	};
	
};

var period = 30 + _power * 2;
var reteats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
update();	
});


time_source_update_destroy = time_source_create(time_source_game,  period * (reteats + 1) / 60, time_source_units_seconds, function () {
instance_destroy();	
});	
	