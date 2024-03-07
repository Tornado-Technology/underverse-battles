// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
		 
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
var raduis =  300;
var _angle =  60;

var i = _angle;
var offset = 0;
repeat(_power div 2 + 2) {
		while (i <= 120) {
				var blades_instance = instance_create_depth(soul_instance.x + dcos(i) * raduis + offset, border_instance.y, fight_depth.bullet_outside, blades_swing, {
				time_destroy : 60	
				});		
			
				var target = point_direction(blades_instance.x, blades_instance.y, soul_instance.x, soul_instance.y);
		
				blades_instance.direction = target;
				blades_instance.image_angle = target;
				blades_instance.speed_const = 3 + _power * 0.2;
				blades_instance.speed_spinning =  2 + _power * 0.1;
				blades_instance.directions();
				blades_instance.move_spinning_independent();
			i += _angle;
			offset += 15;
		 }
	}
}

var period = 33 - 2 - _power * 2;
var repeats = 14 + (_power  * 3);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game,  period *  repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});