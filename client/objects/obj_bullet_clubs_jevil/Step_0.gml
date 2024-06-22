image_index = sprite_frame;
image_angle = self.angle;

if (!destroy) {
	if (image_alpha <= 1) {
		image_alpha += 0.3 * dtime;	
	};
}
else {	
	if (image_alpha >= 0) {
		image_alpha -= 0.3 * dtime;	
	};
};


x = approach(x, target.x, speed_count * dtime);
y = approach(y, target.y, speed_count * dtime);

if (x == target.x && y == target.y && !destroy) {
	var bullets = [];
	var soul = obj_battle_soul;
	var	target_ = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
	var	angle = point_direction(x, y, target_.x, target_.y);
	var j = 0;
	repeat(2) {
		var i = 0;
		repeat(3) {
			var bullet = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
				sprite_index: spr_jevil_bullet,
				speed_count: speed_count - 0.1 * j,
				angle: angle	
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