/// @desc
event_inherited();
depth = fight_depth.bullet_outside_hight;
image_angle = target_angle;
target_speed = 0;

time_source_create_tea = time_source_create(time_source_game, 0.2 - pow / 85, time_source_units_seconds, function() {
	var cahnce = irandom_range(0, 100)
	var bullet = cahnce <= 1 + pow ? obj_drop_tea_heal_delta : obj_drop_tea_delta;
	instance_create_depth(bbox_left + 1, bbox_top + 10, 0, bullet, {
		small: false,
		velocity_y: 0 - pow >= 4 ? 1.5: 0,
		velocity_x: 0,
		floor_y: floor_y
	});
}, [], -1);

time_source_start(time_source_create_tea);
