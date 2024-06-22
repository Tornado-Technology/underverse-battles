event_inherited();

if(sprite_index == teleport) {
	sprite_index = idle_animation;
	teleport_attack = false;

	var angle_bullte = 360 / 3;
	var i = angle_bullte;
	var bullet_instance = [];
	var j = 0;
	while(i <= 360) {
			if (!instance_exists(obj_battle_soul)) exit;
		bullet_instance[j] = instance_create_depth(x, y - (sprite_height / 2), fight_depth.bullet_outside_hight, obj_bullet_jevil, {
			sprite_index: spr_jevil_diamonds,
			speed_count: speed_count,
			angle: point_direction(x, y, obj_battle_soul.x,  obj_battle_soul.y)		
		});
		
		i += angle_bullte;
		j++;
	}
	bullet_instance[0].angle += 15;
	bullet_instance[2].angle -= 15;
};