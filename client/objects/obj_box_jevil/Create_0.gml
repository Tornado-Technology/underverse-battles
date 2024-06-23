step = 2;
speed_count = 0;

bomb = function () {
	var soul = obj_battle_soul;
	var bullet
	var bullets = [];
	var angle;
	var target;
	var i;
	
	switch(sprite_index) {
		case spr_jevil_diamonds_box:
			target = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
			angle = point_direction(x, y, target.x, target.y);
			
			i = 0;
			repeat(3) {
				 bullet = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
					sprite_index: spr_jevil_diamonds,
					speed_count: speed_count - 0.1 * i,
					angle: angle
				})
				i++;
			}
		break;
		
		case spr_jevil_hearts_box: {
			 target = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
			 angle = point_direction(x, y, target.x, target.y);
		
		
			 bullet = instance_create_depth(x, y, 0, obj_jevil_hearts_bullet, {
				angle: angle,
				speed_count: speed_count
			 });
		}
		break;
		
		default:
		case spr_jevil_clubs_box: 
			var angle_offset = 15;
			target = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
			angle = point_direction(x, y, target.x, target.y);
			
			i = 0;
			repeat(3) {
				var bullet = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
					sprite_index: spr_jevil_clubs,
					speed_count: speed_count,
					angle: angle
				})
					bullets[i] = bullet;
				i++;
			}
			
			bullets[0].angle += angle_offset;
			bullets[2].angle -= angle_offset;
			
		break;	
	}
};