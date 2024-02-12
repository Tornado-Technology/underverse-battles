// Arguments: blades_swing

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
		 
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {

var size = choose (dir.left, dir.right, dir.down, dir.up);

if (size == dir.up) {
	var blades_instance = instance_create_depth(border_instance.x - border_instance.left, border_instance.y - border_instance.up, fight_depth.bullet_outside, blades_swing, {
		time_destroy : 60	
		});		
		
		blades_instance.point_stop_x = border_instance.x + border_instance.right - 42;
		blades_instance.point_stop_y = border_instance.y - border_instance.down;
	
		blades_instance.image_angle = 180;
};

if (size == dir.down) {
	var blades_instance = instance_create_depth(border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down, fight_depth.bullet_outside, blades_swing, {
		time_destroy : 60	
		});		
		
		blades_instance.point_stop_x = border_instance.x - border_instance.left + 42;
		blades_instance.point_stop_y = border_instance.y - border_instance.up;
		
		blades_instance.direction = 180;
		blades_instance.image_angle = 180;
};

if (size == dir.left) {
	var blades_instance = instance_create_depth(border_instance.x - border_instance.left, border_instance.y, fight_depth.bullet_outside, blades_swing, {
		time_destroy : 60	
		});	
		
		blades_instance.point_stop_x = border_instance.x + border_instance.right - 40;

		blades_instance.direction = 0;
		blades_instance.image_angle = 90;
};

if (size == dir.right) {
	var blades_instance = instance_create_depth(border_instance.x + border_instance.right, border_instance.y, fight_depth.bullet_outside, blades_swing, {
		time_destroy : 60	
		});		
		
		blades_instance.point_stop_x = border_instance.x - border_instance.left;
	
		blades_instance.direction = 180;
		blades_instance.image_angle = -90;
};

		blades_instance.move(3 + _power * 0.1);
		blades_instance.move_line();
}

var period = 33 - 3 * _power;
var repeats = 14 + (_power div 2 + 3);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60, time_source_units_seconds, function () {
	instance_destroy();	
});