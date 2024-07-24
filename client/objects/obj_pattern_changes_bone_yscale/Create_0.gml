// Arguments: soul_type, gasterblaster_aiming, count, custom_repeats (optional)
random_side = fight_random_integer(dir.left, dir.right);
size_border_up = border_instance.up;

callback = function () {
	soul_instance = soul_type == battle_soul_type.blue ?
		create_soul(border_instance.x, border_instance.y + border_instance.down - 8, soul_type) :
		create_soul(border_instance.x, border_instance.y, soul_type);


	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	

	
update = function() {
	var type_attack = fight_random_integer(0, 3);
	var bone_instance;
	var speed_bone = 2 + _power * 0.01;
	var speed_count = 0.03;
	
	if (type_attack == 0) {	
		var offset = -7;
		var side = -border_instance.left + offset;
		var bone_dir = 0;
		if (random_side == dir.right) {
			offset = 5;
			side = border_instance.right + offset;
			bone_dir = 180;
		};
		
		for (var i = 0; i < 3; ++i) {
			var bone_instance = create_bone(border_instance.x + 20 + side + offset * i * 2, border_instance.y + border_instance.down + 4, bone_changes, speed_bone, 2 + sin(pi *i /2), bone_dir, 0);
	
			with(bone_instance) {
				sprite_set_offset(sprite_index, 8, 18);	
			};
	
			bone_instance.change_scale(speed_count, bone_instance.image_yscale - 0.05 + (0.01 * i));
		}
	} else if (type_attack == 1) {
		var x_;
		var y_ =  border_instance.y - border_instance.up - 10;
		var direction_bone;
		var bone_calse = border_instance._inst_frame_left.image_yscale / 60;
		var offset = 220;
		var i = 0;

		repeat(2) {
			x_ = border_instance.x - border_instance.left - 20;
			direction_bone = point_direction(x_ + (offset * i), y_, border_instance.x, y_);
			bone_instance = create_bone(x_ + (offset * i), y_, bone_changes, speed_bone - 0.5, bone_calse, direction_bone, 180);
			bone_instance.scale_start = 3;
			
			with(bone_instance) {
				sprite_set_offset(sprite_index, 8, 18);	
			};
	
			bone_instance.change_scale(speed_count + 0.02, bone_calse + 3);
			i++;	
		}		
	} else if (type_attack == 2) {
		var size_bone_main = border_instance._frame_right_height;
		var bone_main_y = border_instance.y - border_instance.up;
		var bone_main_x = border_instance.x + border_instance.right + 20;	
		var bone_y = border_instance.y + border_instance.down;
	
		size_bone_main -= 8 - (_power + 1);	

		size_bone_main /= random_range(28 - _power + 1, 29);
		var size_bone = size_bone_main / random_range(4, 6);
		
		var direction_bone = point_direction(bone_main_x, bone_main_y, border_instance.x, bone_main_y);
		create_bone(bone_main_x, bone_main_y, bone, speed_bone, size_bone_main, direction_bone, 180);
		create_bone(bone_main_x, bone_y, bone, speed_bone, size_bone, direction_bone, 0);
	} else if (type_attack == 3) {
		var size_bone_main = border_instance._frame_right_height;
		var bone_main_y = border_instance.y - border_instance.up;
		var bone_big_x = border_instance.x + border_instance.right + 20;
		var bone_smail_x = border_instance.x - border_instance.left - 20;
		var bone_y = border_instance.y + border_instance.down;
	
		size_bone_main -= 8 - (_power + 1);	

		size_bone_main /= random_range(28 - _power + 1, 29);
		var size_bone = size_bone_main / 3;
		
		var direction_bone = point_direction(bone_big_x, bone_main_y, border_instance.x, bone_main_y);
	
		create_bone(bone_big_x, bone_main_y, bone, speed_bone, size_bone_main, direction_bone, 180);
		create_bone(bone_smail_x, bone_y,bone, speed_bone + 0.5, size_bone, 0, 0);		
	};


}

var period = 50 - _power * 2 ;
var repeats = 9 + _power;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});