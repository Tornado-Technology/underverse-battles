// Arguments: bone, gasterblaster

max_position = 3;
position = fight_random_integer(0, max_position - 1);

platforms_speed = 0.5 + _power * 0.1;

callback = function () {
	
	var  position_x = border_instance.x - border_instance.left + 5;
	var sector_y = border_instance.y + border_instance.down - 20;
	create_moving_platforms(border_instance.x - border_instance.left - 40, sector_y, 4, 6, 60, platforms_speed);
		
	
	var position_x = border_instance.x - border_instance.left - 10;
	var position_y = border_instance.y;

	var bone_instance;
	var i = 45;
	repeat(2) {
		bone_instance =	create_bone(position_x, position_y, obj_bone_rotating_papyrus, 0, 4, 0, i);
		bone_instance.speed_spinning = 3 + _power * 0.1;
		
		i += 80;	
	}
	
		
	var soul_offset = 5;
	var soul_position =(new Vector2(border_instance.x, sector_y ));
	soul_instance = create_soul(soul_position.x, soul_position.y - 20, battle_soul_type.blue);
	
	while(position_x <= border_instance.x + border_instance.right + 10) {
		create_bone(position_x, border_instance.y + border_instance.down + 3, bone, 0, 1, 0, 0);
		position_x += 10;
	}
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var position_x = border_instance.x + border_instance.right + 20;
	var position_y = border_instance.y + border_instance.down;
	var speed_const = 2 + _power * 0.1;
	var side_bone = fight_random_float(1.6, 3.6);

	var bone_instance = create_bone(position_x, position_y, bone, speed_const, side_bone, 180, 0);
	create_moving_platforms(border_instance.x + border_instance.right + 1.5, position_y - (bone_instance.sprite_height), 1, 6, 60, -speed_const);
	create_moving_platforms(border_instance.x + border_instance.right - 20, position_y - (bone_instance.sprite_height / 2), 1, 3, 60, -speed_const);

}


var period = 50 - _power;
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

		
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});