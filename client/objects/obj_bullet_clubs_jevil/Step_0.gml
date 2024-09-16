image_angle = point_direction(x, y, obj_battle_border.x, obj_battle_border.y);
image_index = sprite_frame;

if (!destroy) {
	if (image_alpha <= 1) {
		image_alpha += 0.03 * dtime;	
	};
}
else {	
	if (image_alpha >= 0) {
		image_alpha -= 0.03 * dtime;	
	} else {
		instance_destroy();	
	}
};

x =  center_x + dcos(angle) * radius;
y =  center_y + -dsin(angle) * radius;

if (stage == 0) {
	radius -= step * dtime;
	if(radius <= radius_max - 20) {
		stage = 1;
	} 
}

if (stage == 1 && !destroy) {
	var bullets = [];
	var soul = obj_battle_soul;
	var	target_ = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
	var	angle_ = point_direction(x, y, target_.x, target_.y);
	var j = 0;
	repeat(count_repeat_spwan) {
		var i = 0;
		repeat(3) {
			var bullet = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
				sprite_index: spr_jevil_bullet,
				speed_count: speed_count - 0.1 * j,
				angle: angle_	
			})
			bullets[i] = bullet;
			i++;
			j+= 0.3;
		};
	
		bullets[0].angle += 15;
		bullets[2].angle -= 15;
	
	}
	destroy = true;
};