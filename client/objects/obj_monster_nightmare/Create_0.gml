event_inherited();

depth = fight_depth.bullet_outside_hight;

image_alpha = 0;


damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

self.i = 0;
disable_surface  = true;
angle_fist = position_opponent ? 180 : 0; 

start_attack_fist = false;

approximation = 40;

step = 0.09;

var i = 0;
repeat(2) {
	fist[i] = instance_create_depth(x - (70 * i), y - (5 * i), fight_depth.bullet_outside_hight, obj_fist_nightmare, {
		speed_count: speed_count,
		image_xscale: image_xscale
	});	
	
	fist[i].depth =  fight_depth.bullet_outside_hight + -500;
	fist[i].step = step;
	fist[i].direction = angle_fist;
	fist[i].index_sprite = sprite_get_number(fist[i].sprite_index) - 1;
	
	i++;
}

angle = 0;

position = x;
position_y = y;
hand_down = false;
fist_attack = false;

image_xscale = position_opponent ? -1 : 1;

time_source_attack = time_source_create(time_source_game, 30 / 60, time_source_units_seconds, function () {
	position = fight_random_integer(1, 100) <= 40 ? position_head_x + (position_opponent ? -approximation : approximation) : position_head_x;
}, [], -1);

time_source_hand_donw = time_source_create(time_source_game, 80 / 60, time_source_units_seconds, function () {
	i = fight_random_integer(0, 1);
	
	hand_down = true;
	fist_attack = true;
});

time_source_attack_timer = time_source_create(time_source_game, 70 / 60, time_source_units_seconds, function () {
	time_source_start(time_source_hand_donw);
});