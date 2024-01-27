var target = (instance_exists(soul) ?  Vector2(soul.x, soul.y) : Vector2());
var angle = point_direction(x, y, target.x, target.y);
var spd = 2 * dtime;

switch (sprite_index) {	
	case spr_jevil_clubs_box :
		var angle_offset = 15;
		var bullets = [];
		var i = 0;
		repeat (_power div 4 + 3) {
			var bullet = instance_create_depth(x, y, 0, obj_jevil_bullet, {
				image_speed : 0,
				image_index : 0
				});
				bullet._speed = spd;
				bullet._angle = angle;
				bullets[i]    = bullet;
				i++;
		};
		
		bullets[0]._angle += angle_offset;
		bullets[2]._angle -= angle_offset;
	break;
	
	case spr_jevil_hearts_box : 
		delete target;

		var bullet = instance_create_depth(x, y, 0, obj_jevil_hearts_bullet, {
			_speed : spd,
			_angle : angle
		});
	break;
	
	case spr_jevil_spades_box :
		var angle = 30;
		var i = 0;
		repeat (12) {
			var bullet = instance_create_depth(x, y, 0, obj_jevil_bullet, {
			image_speed : 0,
			image_index : 0
			});
			bullet._speed = spd;
			bullet._angle = angle * i;
			bullet[i] = bullet;
			i++;
		};
		
	break;
	
	default: 
	case spr_jevil_diamonds_box :
		var spd_offset = 0.1;
		
		var i = 0;
		repeat (3) {
			var bullet = instance_create_depth(x, y, 0, obj_jevil_bullet, {
				sprite_index : spr_jevil_diamonds,
				image_speed : 0,
				image_index : 0
				});
				bullet._speed = spd - spd_offset * i;
				bullet._angle = angle;
				i++;
		};
	
	break;
}
