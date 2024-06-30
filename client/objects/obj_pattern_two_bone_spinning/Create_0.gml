// Arguments: bone



callback = function () {
	create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	speed_max = irandom(1) ? (1.8 + _power * 0.1) : -(1.8 + _power * 0.1);
	bone_instance = [];
	bone_instance_1 = [];
	var i = 0;
	var j = 0;
	var bone_instance_1_count = 0;
	var  angle = 45;
	var  angle_y_bone = 45;
	
	repeat(2) { 
		var position_x = [border_instance.x - border_instance.left - 10, border_instance.x + border_instance.right + 10];
		var position_y = border_instance.y;
	
	
		repeat(2) {
			bone_instance[j] =	create_bone(position_x[i], position_y, obj_bone_spinning_papyrus, 0, 7.1, 0, angle);
		
			with(bone_instance[j]) {
				sprite_set_offset(sprite_index, 5, 9);	
			};	
			
			angle+= 80;	
			j++;
		}
		
		repeat(2) {
			bone_instance_1[bone_instance_1_count] = create_bone(border_instance.x, border_instance.y - border_instance.up - 10 + (130 * i), obj_bone_spinning_papyrus, 0, 3.4, 0, angle_y_bone);
			with(bone_instance_1[bone_instance_1_count]) {
				sprite_set_offset(sprite_index, 5, 9);	
			};	
			
		
			angle_y_bone += 80;
			bone_instance_1_count++;
		}
		
		
		i++;
		angle += angle * i;
	}
	
	
	
	time_source_start(time_source_start_moving);
	time_source_start(time_source_update_destroy);
}

var period  = 30;

time_source_start_moving = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {

	var step = 0.03 + _power * 0.01;
	var i = 0;
	repeat(array_length(bone_instance)) {
			bone_instance[i].speed_spinning = approach(bone_instance[i].speed_spinning, speed_max, step * dtime);
			bone_instance_1[i].speed_spinning = approach(bone_instance_1[i].speed_spinning, speed_max, step * dtime);
		i++;
	}
		
	
	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});