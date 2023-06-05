/// @description Methods

// Кружка чая
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		instance_cup = instance_create_depth(border_instance.x, border_instance.y - border_instance.up - 32, 0, obj_cup_delta, {
			pow: pow + 2,
			floor_y: border_instance.y - border_instance.up,
			target_speed_max: 2,
			target_speed: 2,
			target_angle: 45,
			target_left: border_instance.x - border_instance.right + 20,
			target_right: border_instance.x + border_instance.left + 20,
			target_direction: dir.left
		});
	}
}

// Атака 1
if (_id == 0 && attack_num == 1) {
	update_0_1 = function(pow) {
		var inst = noone;
		inst = instance_create_depth(border_instance.x - border_instance.left / 2 - 25, border_instance.y - border_instance.up,  fight_depth.bullet_outside_hight, obj_platform);
		inst.image_xscale = 6;
		inst._angle = dir.down;
		inst.const_speed = 1;
			 
		inst = instance_create_depth(border_instance.x + border_instance.right / 2, border_instance.y - border_instance.up, fight_depth.bullet_outside_hight, obj_platform);
		inst.image_xscale = 6;
		inst._angle = dir.down;
		inst.const_speed = 1;
	}
}

// Притяжение
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		var inst = instance_create_depth(border_instance.x - border_instance.right, border_instance.y + border_instance.down - 25, fight_depth.bullet_outside_hight, obj_platform);
		inst.image_angle = 0;
		inst.image_xscale = 5;
		inst._angle = dir.right;
		inst.const_speed = 1 + 0.8 / pow;
	}
	
	update_0_2_2 = function(pow) {
		var new_direction = dir.down;
		soul_instance.change_gravity_force(new_direction);
	}
}