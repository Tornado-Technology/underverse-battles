// Arguments: blades_swing 
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}


update = function() {
var radius = 220;
var point = choose(90, 180);
var offset = 50;
var _xx = 0;
var _yy = 0;

var i = 0;
var count = 2;
repeat (count) {
	var angle_offset =  i == 0 ? -point : point;
	var blades_x = dcos(angle_offset) * radius;
	var blades_y = dsin(angle_offset) * radius;
	if (point == 90) {	
		_xx = soul_instance.x;
		_yy = border_instance.y - border_instance.up - offset + blades_y * i;
	}
	else {
		_xx = border_instance.x - border_instance.left - offset - blades_x * i;	
		_yy = soul_instance.y;
	}
	
	var  blades_instance = instance_create_depth(_xx, _yy, fight_depth.bullet_outside_hight, blades_swing, {
		time_destroy : 32
	});
		var target = point_direction(blades_instance.x, blades_instance.y, soul_instance.x, soul_instance.y);
		
		blades_instance.direction = target;
		blades_instance.image_angle = target;
		blades_instance.speed_const = 2 + _power * 0.1;
		blades_instance.trap();
		i++;
	}
}

var period = 43 - 3 * _power;
var repeats = 14 + (_power div 2);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60, time_source_units_seconds, function () {
	instance_destroy();	
});