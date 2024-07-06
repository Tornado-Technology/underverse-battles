event_inherited();
damage = get_char_damage(obj_character_jevil);
disable_surface = true;


gradually_appearing = function () {
 image_alpha = 0;	
 gradually_alpha = true;	
}


soul_invulnerability = 20;
moving = true;
attack = false;
is_bonb = false;
backwards = false;

moving_y = 1;

angle_scythe = 0;

position_x = 0;

alpha = 1;
radius = 10;
alpha_time = 0.05;

backwards_count = 2;


step = 0.02;

time_before_attack = 20;

image_xscale = x > obj_battle_border.x ? -1 : 1;
sides_scythe = 1;


be_spwan = false;

spwan_diamonds = function () {
	if (be_spwan) return true;
	var angle = irandom_range(300, 360) / 4;
	var radius_scythe = 120;
	var  scythe_instance;
	
	var i = angle;
	while(i <= 360) {
		var bullet_instance = instance_create_depth(x + dcos(i) * 10, y + -dsin(i) * 10, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
			 sprite_index: spr_jevil_diamonds,
			 angle: i
		 });	

		bullet_instance.speed_count = 3;
		i+= angle;
	}	
	be_spwan = true;
}