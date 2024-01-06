// Arguments: gasterblaster

callback = function () {
	_soul = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function(pow) {
	var x_gb, y_gb;
	var gb_size = 60;
	var pos = irandom_range(0, 3);
	var con = room_height + gb_size;
	var rnd = irandom_range(-gb_size, con);
			
	repeat(2) {
		switch (pos) {
			case 0:
				x_gb = -gb_size;
				y_gb = rnd;
				break;
		
			case 1:
				x_gb = rnd;
				y_gb = con;
				break;
		
			case 2:
				x_gb = con;
				y_gb = rnd;
				break;
		
			case 3:
				x_gb = rnd;
				y_gb = -gb_size;
				break;
		}
		create_gasterblaster(gasterblaster, x_gb, y_gb, border_instance.x, border_instance.y, point_direction(x_gb, y_gb, border_instance.x, border_instance.y) + 90, 1/6, 1 - _power * 0.1);
		pos = (pos + 1) % 4;
	}
}

var period = 65 - _power * 6;
var repeats = 5 + _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
		
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});