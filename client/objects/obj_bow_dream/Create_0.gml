index = 0;

started = false;
step = 0.1;

arrows_instance = noone;

target = obj_battle_soul;
image_angle = point_direction(x, y, target.x, target.y);

arrows_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_arrows_dream, {
	_power : _power,
	direction: direction,
});

arrows_instance.speed_const = 3 + _power * step;

charge_sprite = spr_bow_charging_dream;
shot_sprite = spr_bow_shooting_dream;

//Time source	
event_user(0);