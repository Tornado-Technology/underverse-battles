
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue);

	update_two_bone();

	time_source_start(time_source_update_two_bone);
	time_source_start(time_source_destroy_update);
}



update_two_bone = function () {
	var speed_bone = 3 + _power * 0.1;
	var angle;
	var bone_instance;
	var offset_x = 0;
	var offset_y = 0;
	var position_x;
	var position_y;
	var bone_count =  3;
	if (irandom(1)) {
		
		repeat(bone_count) {
				if (irandom(1)) {
				 position_x = fight_random_integer(border_instance.x - border_instance.left - 30, border_instance.x + border_instance.right + 30);
				 position_y = border_instance.y - border_instance.up - 20;
		
				offset_x = 70;
				angle = point_direction(position_x, position_y, position_x, border_instance.y);
			} else {
				position_x = choose(border_instance.x - border_instance.left - 20, border_instance.x + border_instance.right + 20);
				position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
				
				offset_y = 50;
				
				angle = point_direction(position_x, position_y, border_instance.x, position_y);
			};
			
			
			
			 bone_instance = create_bone(position_x, position_y, obj_bone_spinning_papyrus, speed_bone, 1.5, angle, 0);
			
			 bone_instance.speed_spinning = speed_bone;
		}
	
	} else {
		create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, obj_bone_blue_papyrus, speed_bone, border_instance._frame_right_height / 18.5, 180, 0);
	}

}

var period = 40 - _power;
var repeats = 10 + _power * 2;

time_source_update_two_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_two_bone();
}, [], -1);

time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
