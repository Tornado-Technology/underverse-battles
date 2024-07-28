event_inherited()
sprite_fram = 0;
damage = 1;
started = false;
step = 0.1;
step_alpha = 0.05;

image_alpha = 0;
arrows_instance = noone;

destroying = false;
	
arrow_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, arrow, {
	direction: direction,
	can_ricochet: can_ricochet
});

arrow_instance.image_angle = image_angle;
arrow_instance.speed_const = speed_const;
	
charge_sprite = spr_bow_charging_dream;
shot_sprite = spr_bow_shooting_dream;

//Time source	
event_user(0);
time_source_start(time_source_target);