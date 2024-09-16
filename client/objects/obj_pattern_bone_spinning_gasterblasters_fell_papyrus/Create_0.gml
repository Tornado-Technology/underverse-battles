// Arguments: soul_type, gasterblaster_aiming, count, custom_repeats (optional)

callback = function () {
	var scale = 5;
	var bone_position_x = border_instance.x - 45;
	var bone_right_position_x = border_instance.x + 45;
	
	platforms0 = create_moving_platforms(border_instance.x - 40, border_instance.y + border_instance.down - 30, 1, scale, 0, 1, obj_platform_1);
	platforms1 = create_moving_platforms(border_instance.x + 20, border_instance.y + border_instance.down - 30, 1, scale, 0, 1, obj_platform_1);
	platforms1[0].the_blow_angle = 0;
	
	var position_soul = fight_random_choose(platforms0[0], platforms1[0]);
	soul_instance = create_soul(position_soul.x - 10, position_soul.y, battle_soul_type.blue); 
	
	while(bone_position_x > border_instance.x - border_instance.left - 10) {
		create_bone(bone_position_x, border_instance.y - border_instance.up, obj_bone_sans, 0, 2, 0, 180);
		create_bone(bone_position_x, border_instance.y + border_instance.down, obj_bone_sans, 0, 2, 0, 0);
		bone_position_x -= 10;	
	}
	
	while(bone_right_position_x < border_instance.x + border_instance.right + 10) {
		create_bone(bone_right_position_x, border_instance.y - border_instance.up, obj_bone_sans, 0, 2, 0, 180);
		create_bone(bone_right_position_x, border_instance.y + border_instance.down, obj_bone_sans, 0, 2, 0, 0);
		bone_right_position_x += 10;	
	}
	
	var i = 0;
	var  angle = 45;
	var  angle_y_bone = 45;
	var scale_bone = 4;
	repeat(2) { 
		var position_x = border_instance.x;
		var position_y = border_instance.y + border_instance.down - 10;
	

		var bone_instance =	create_bone(position_x, position_y, obj_bone_fell_papyus, 0, scale_bone, 0, angle);
		var bone_instance_1 = create_bone(border_instance.x, border_instance.y - border_instance.up + 10, obj_bone_fell_papyus, 0, scale_bone, 0, angle);
			
		bone_instance.speed_max = 3 + _power * 0.1;
		bone_instance_1.speed_max = 3 + _power * 0.1;	
		angle *= 3;	
		
		i++;
	}
	
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	var offset = 10;
	var position_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	var position_y = fight_random_choose(border_instance.y - border_instance.up - offset, platforms1[0].y);
	var angle_ = 	position_x == border_instance.x - border_instance.left - offset ? 90 : 270;
	var angle_border = point_direction(position_x, position_y, border_instance.x, border_instance.y) + 90;
	var angle = position_y == border_instance.y - border_instance.up - offset ?  angle_border :  angle_;
	
	create_gasterblaster(gasterblaster_aiming, position_x, position_y, position_x, position_y, angle, 1 / 8, 1 - _power * 0.1, 15/60, 1/6);
}

var period = 80 - _power * 2;
var repeats = 10 + _power * 2;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});