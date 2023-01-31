/// @desc spawn bullets
switch (sprite_index) {
	default:
	case spr_jevil_diamonds_box:
			var spd = 2.7;
			var spd_offset = 0.1;
		    var soul = obj_battle_soul;
			var target = (instance_exists(soul) ?  Vector2(soul.x, soul.y) : Vector2());
			var angle = point_direction(x, y, target.x, target.y);
		
			for (var i = 0; i < 3; i++;) {
				var bullet = instance_create_depth(x, y, 0, obj_jevil_bullet);
				bullet.sprite_index = spr_jevil_diamonds;
				bullet.image_speed = 0;
				bullet.image_index = 0;
				bullet._speed = spd - spd_offset * i;
				bullet._angle = angle;
			}
		break;
		
	case spr_jevil_clubs_box:
		var spd = 2.7;
		var angle_offset = 15;
	    var soul = obj_battle_soul;
		var target = (instance_exists(soul) ?  Vector2(soul.x, soul.y) : Vector2());
		var angle = point_direction(x, y, target.x, target.y);
		var bullets = [];
		
		for (var i = 0; i < 3; i++;) {
			var bullet = instance_create_depth(x, y, 0, obj_jevil_bullet);
			bullet.sprite_index = spr_jevil_clubs;
			bullet.image_speed = 0;
			bullet.image_index = 0;
			bullet._speed = spd;
			bullet._angle = angle;
			bullets[i]    = bullet;
		}
		
		bullets[0]._angle += angle_offset;
		bullets[2]._angle -= angle_offset;
		break;
		
	case spr_jevil_hearts_box:
			var spd = 2.7;
		    var soul = obj_battle_soul;
			
			var target = (instance_exists(soul) ?  Vector2(soul.x, soul.y) : Vector2());
			var angle = point_direction(x, y, target.x, target.y);
			delete target;
		
		
			var bullet = instance_create_depth(x, y, 0, obj_jevil_hearts_bullet);
			bullet._speed = spd;
			bullet._angle = angle;
		break;
		
	case spr_jevil_spades_box:
		var spd = 2.7;
		var angle = 30;
	    var soul = obj_battle_soul;
			for (var i = 0; i < 12; i++;) {
			var bullet = instance_create_depth(x, y, 0, obj_jevil_bullet);
			bullet.sprite_index = spr_jevil_spades;
			bullet.image_speed = 0;
			bullet.image_index = 0;
			bullet._speed = spd;
			bullet._angle = angle * i;
			bullets[i] = bullet;
		}
		break;
}