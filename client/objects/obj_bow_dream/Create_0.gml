event_inherited()
index = 0;
damage = 1;
started = false;
step = 0.1;
image_alpha = 0;
arrows_instance = noone;

stop_alpha = false;

target = obj_battle_soul;

arrows_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, arrows, {
	_power: _power,
	direction: direction
});

arrows_instance.speed_const = speed_const;
charge_sprite = spr_bow_charging_dream;
shot_sprite = spr_bow_shooting_dream;

//Time source	
event_user(0);
time_source_start(time_source_target);