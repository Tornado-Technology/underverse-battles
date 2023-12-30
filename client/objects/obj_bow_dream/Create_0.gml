index = 0;

started = false;
step = 0.1;

arrows_instance = noone;

arrows_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, arrows, {
	_power : _power,
	target : target,	
	border_instance : border_instance
	});

arrows_instance.speed_const = 3 + _power * step;

charge_sprite = spr_bow_charging_dream;
shot_sprite = spr_bow_shooting_dream;


//Time source	
event_user(0);