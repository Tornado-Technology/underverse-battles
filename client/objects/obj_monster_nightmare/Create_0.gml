event_inherited();
depth = fight_depth.bullet_outside_hight;


is_destroying_outside = false;
radius = 20;

image_alpha = 0;

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

angle = 0;

self.i = 0;
disable_surface = true;
angle_fist = position_opponent ? 180 : 0; 

start_attack_fist = false;

approximation = 40;

step = 0.09;

var i = 0;
repeat(2) {
	fist_instance[i] = instance_create_depth(x, y , fight_depth.bullet_outside_hight, fist, {
		speed_count: speed_count,
		image_xscale: image_xscale,
		disable_surface: true,
	});	
	fist_instance[i].disable_surface = true;
	fist_instance[i].depth =  fight_depth.bullet_outside_hight + -500;
	fist_instance[i].step = step;
	fist_instance[i].direction = angle_fist;
	
	i++;
}



position = x;
position_y = y;
hand_down = false;

image_xscale = position_opponent ? -1 : 1;



active_fist = function () {
	var i = fight_random_integer(0, 1);
	var up = obj_battle_border.y - obj_battle_border.up + 10;
	var down = obj_battle_border.y + obj_battle_border.down - 10;
	var num_fist_attack = i > 0 ? 0 : 1;
	var bone_old = fist_instance[num_fist_attack];
	
	 fist_instance[num_fist_attack].smooth_y(fight_random_integer(up, down));
	
	 fist_instance[num_fist_attack] =	instance_create_depth(bone_old.x, bone_old.y, bone_old.depth, fist, {
		speed_count: speed_count,
		image_xscale: image_xscale,
	});
	
	 fist_instance[num_fist_attack].disable_surface =  true; 
	 fist_instance[num_fist_attack].direction = angle_fist;
	 fist_instance[num_fist_attack].depth = bone_old.depth;
	 fist_instance[num_fist_attack].step = step;	
}


time_source_attack = time_source_create(time_source_game, 30 / 60, time_source_units_seconds, function () {
	position = fight_random_integer(1, 100) <= 40 ? position_head_x + (position_opponent ? -approximation : approximation) : position_head_x;
}, [], -1);

time_source_hand_donw = time_source_create(time_source_game, 130 / 60, time_source_units_seconds, active_fist, [], -1);

