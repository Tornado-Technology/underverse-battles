/// Arguments: diamonds

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
			
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var position_x;
	var position_y;
	var direction_bullet;
	var speed_bullet = _power > 4 ? 3.5 :  3 + _power * 0.1;
	var vertical = fight_random_integer(0, 1);
	var offset = 40;
	var box_instance;
	
	var i = 0;
	repeat(3) {	
		offset += 5 * i;
		if (vertical) {
			position_x = fight_random_integer(border_instance.x - border_instance.left + 10, border_instance.x + border_instance.right + 5);
		
			if (fight_random_integer(0, 1)) {
				position_y = border_instance.y - border_instance.up - offset;
				direction_bullet = 270;
			} else {
				position_y = border_instance.y + border_instance.down + offset;
				direction_bullet = 90;
			}
		
			box_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, diamonds, {
				direction: direction_bullet,
				angle: 0,
				speed_count: speed_bullet
			});
		
		} else {
			position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		
			if (fight_random_integer(0,1)) {
				position_x = border_instance.x - border_instance.left - offset;	
				direction_bullet = 0;
			} else {
				position_x = border_instance.x + border_instance.right + offset;
				direction_bullet = 180;
			}
		
			box_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, diamonds, {
				direction: direction_bullet,
				angle: 90,
				speed_count: speed_bullet
			});
		}
	
		box_instance.step = 0.01 + _power * 0.01;
		i++;
	}

}

var period = 40 - _power * 2;
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, repeats * period / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});