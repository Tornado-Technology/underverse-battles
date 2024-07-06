// Arguments: soul_type, gasterblaster_aiming, count, custom_repeats (optional)
random_side = fight_random_integer(dir.left, dir.right);
callback = function () {
	soul_instance = soul_type == battle_soul_type.blue ?
		create_soul(border_instance.x, border_instance.y + border_instance.down - 8, soul_type) :
		create_soul(border_instance.x, border_instance.y, soul_type);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	var type_attack = fight_random_integer(0, 1);
	var bone_instance;
	var speed_count = 0.03;
	
//if (type_attack) {	
//		var offset = -7;
//		var side = -border_instance.left + offset;
	
//		var bone_dir = 0;
//		if (random_side == dir.right) {
//			offset = 5;
//			side = border_instance.right + offset;
//			bone_dir = 180;
//		}
//		for (var i = 0; i < 3; ++i) {
//		var bone_instance = create_bone(border_instance.x - 20 + side + offset * i * 2, border_instance.y + border_instance.down + 4, obj_bone_changes_papyrus, 2 + 0.1 * _power, 2 + sin(pi *i /2), bone_dir, 0);
	
//		with(bone_instance) {
//			sprite_set_offset(sprite_index, 8, 18);	
//		};
	
//		bone_instance.change_scale( speed_count, bone_instance.image_yscale - 0.05 + (0.01 * i));
//		}
//	} 	else  {
//		var x_;
//		var y_ =  border_instance.y - border_instance.up;
//		var direction_bone;
//		var offset = 220;
//		var i = 0;

//		repeat(2) {
//			x_ = border_instance.x - border_instance.left - 20;
//			direction_bone = point_direction(x_ + (offset * i), y_, border_instance.x, y_);
//			bone_instance = create_bone(x_ + (offset * i), y_, obj_bone_changes_papyrus, 2 + 0.1 * _power, 3, direction_bone, 180);
//			bone_instance.scale_start = 3;
//		with(bone_instance) {
//			sprite_set_offset(sprite_index, 8, 18);	
//		};
	
//		bone_instance.change_scale(speed_count + 0.05, 5);
//			i++;	
//		}
			
//	}

	var skate_instance = instance_create_depth(border_instance.x + border_instance.right, border_instance.y, fight_depth.bullet_outside_hight, obj_skate_papyrus, {
		direction: 180,
		speed_const: 2 + _power * 0.1
	});
	skate_instance.disable_surface = true;
var bone_instance =	instance_create_depth(border_instance.x + border_instance.right, border_instance.y, fight_depth.bullet_outside_hight, obj_cool_bone_papyrus, {
		skate: skate_instance.id
	});
	bone_instance.speed_const = 3 + _power * 0.1;
	bone_instance.disable_surface = true;
}

var period = 50 - _power * 2 ;
var repeats = 9 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});