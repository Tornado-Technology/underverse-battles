// Arguments: soul_type, gasterblaster_aiming, count, custom_repeats (optional)

random_side = fight_random_integer(dir.left, dir.right);
size_border_up = border_instance.up;

big_bone_instance = noone;
bone_instances = [noone];
big_jump_area_left = border_instance.x + border_instance.right;
big_jump_area_right = border_instance.x + border_instance.right;

soul_instance = noone;

callback = function() {
	soul_instance =	create_soul(border_instance.x, border_instance.y + border_instance.down - 10, battle_soul_type.blue);

	time_source_start(time_source_cool_bone);
	time_source_start(time_source_update);
	time_source_start(time_source_update_last_bone);
	time_source_start(time_source_update_destroy);
}
	
spwan_cool_bone = function() {
	instance_create_depth(border_instance.x + border_instance.right + 50, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, skate, {
		direction: 180,
		speed_const: 2
	});
}

update_collision = function() {	
	var border_up = border_instance.up;
	
	if (border_up < size_border_up + 50) {
		if(point_distance(soul_instance.x, soul_instance.y, soul_instance.x, border_instance._inst_frame_up.y) < 10) {
			border_instance.up++;
		}		
	}
}

spwan_big_bone = function() {
	var position_x;
	var position_y = border_instance.y + border_instance.down;
	var bone_count = 20;
	var offset = 10;
	
	var i = 0;
	repeat(bone_count) {
		position_x = (border_instance.x + border_instance.right + 10) + (offset * i); 
		bone_instances[i] =	instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, bone, {
			direction: 180
		});
		bone_instances[i].outside_room_destroy = false;
		bone_instances[i].speed_const = 2;
		
		i++;
	}
	
	var big_bone_x = (sprite_get_width(spr_big_bone_papyrus) / 2.6);
	big_bone_instance = instance_create_depth(position_x + big_bone_x, position_y, fight_depth.bullet_outside_hight, big_bone, {
		direction: 180,
		image_xscale: 0.6,
		image_yscale: 0.6
	});
	big_bone_instance.speed_const = 2;

	time_source_start(time_source_update_collision);
}

spwan_last_bone = function() {
	create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, obj_bone_papyrus, 4, 0.9, 180, 0);
}

time_source_update_collision = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function() {
	update_collision();	
}, [], -1);

time_source_cool_bone = time_source_create(time_source_game, 70 / 60, time_source_units_seconds, function() {
	spwan_cool_bone();	
});

time_source_update = time_source_create(time_source_game, 150 / 60, time_source_units_seconds, function() {
	spwan_big_bone();
});

time_source_update_last_bone = time_source_create(time_source_game, 7, time_source_units_seconds, function() {
	spwan_last_bone();
});

time_source_update_destroy = time_source_create(time_source_game, 8.5, time_source_units_seconds, function() {
	instance_destroy();
});