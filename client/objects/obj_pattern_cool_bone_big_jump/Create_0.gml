// Arguments: soul_type, gasterblaster_aiming, count, custom_repeats (optional)
random_side = fight_random_integer(dir.left, dir.right);
border_instance.y += 20;
size_border_up = border_instance.up;
callback = function () {
	soul_instance =	create_soul(border_instance.x, border_instance.y + border_instance.down - 10, battle_soul_type.blue);

	time_source_start(time_source_cool_bone);
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

	
spwan_cool_bone = function() {
	instance_create_depth(border_instance.x + border_instance.right  + 50, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, obj_skate_papyrus, {
		direction: 180,
		speed_const: 2 + _power * 0.1
	});	
		
}

update_collision = function () {	
	var border_up = border_instance.up;
	
	if(border_up < size_border_up + 30) {
		if(point_distance(soul_instance.x, soul_instance.y, soul_instance.x, border_instance._inst_frame_up.y) < 10) {
			border_instance.up += 2;
		};
		
		soul_instance.fly_time = 0;
		soul_instance.is_jumping = true;
	};
	
}

spwan_big_bone = function () {
	var x_;
	var y_;
	var big_bone_x = (sprite_get_width(spr_big_bone_papyrus) / 2.6);
	var offset = 10;
	
	var bone_instance;
	var bone_end;
	
	var i = 0;
	repeat(20) {
		x_ = (border_instance.x + border_instance.right + 10) + (offset * i); 
		bone_instance =	instance_create_depth(x_, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, obj_bone_papyrus, {
			direction: 180
		});
		
		bone_instance.outside_room_destroy = false;
		bone_instance.speed_const = 2 + _power * 0.1;
			
		i++;
	}
	
	
	 big_bone_instance = instance_create_depth(x_ + big_bone_x, border_instance.y + border_instance.down + 5, fight_depth.bullet_outside_hight, obj_big_bone_papyrus, {
		direction: 180,
		image_xscale: 0.6,
		image_yscale: 0.6
	});
	
	big_bone_instance.speed_const =  2 + _power * 0.1;
	
	bone_end = create_bone(x_ + big_bone_x + 800, border_instance.y + border_instance.down, obj_bone_papyrus, 4 + _power * 0.2, 1, 180, 0);
	bone_end.outside_room_destroy = false;

	time_source_start(time_source_update_collision);
}

var period = (150 - _power * 2);
var repeats = 3;

time_source_update_collision = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	update_collision();	
}, [], -1);



time_source_cool_bone = time_source_create(time_source_game,  70 / 60, time_source_units_seconds, function () {
	spwan_cool_bone();	
});


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	spwan_big_bone();
});

	
time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60, time_source_units_seconds, function () {
	instance_destroy();
});