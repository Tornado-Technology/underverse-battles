event_inherited();

disable_surface = true;
alpha = 1;
alpha_shadow = 0.5;
be_spwan = false;
destroy = false;

sprite_frame = 0;

image_alpha = 0;
step = 0.05;

direction = x > obj_battle_border.x ? 0 :  180;
start_xscalse = x > obj_battle_border.x ? -1 : 1;
image_xscale = 0;


offset = x > obj_battle_border.x ? -10 : 10;

spwan = function () {
	var angle_bullte = 360 / 3;
	var i = angle_bullte;
	var bullet_instance = [];
	var j = 0;
	while(i <= 360) {
			if (!instance_exists(obj_battle_soul)) exit;
			
			bullet_instance[j] = instance_create_depth(x, y - sprite_height / 1.5, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
			sprite_index: spr_jevil_diamonds,
			speed_count: speed_count,
			angle: point_direction(x, y, obj_battle_soul.x,  obj_battle_soul.y)		
		});
		
		i += angle_bullte;
		j++;
	}
	bullet_instance[0].angle += 15;
	bullet_instance[2].angle -= 15;
	audio_play_sound_plugging(snd_teleport_jevil);
}		