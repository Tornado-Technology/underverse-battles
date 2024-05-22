event_inherited();

damage = get_char_damage(obj_character_nightmare);
pusher = 10;

depth = fight_depth.bullet_outside_hight;

tentacles_counst_spwan = 4;
speed_count = 2;

L = 30;

spwan_tentacles = function () {
var R = 360;
var angle =  R / tentacles_counst_spwan;
var i = 0;
	while(i < R) {
		var tentacles_instance = instance_create_depth(x + dcos(i) * L, y + -dsin(i) * L,  fight_depth.bullet, obj_tentacles_destroy_back_nightmare, {
			image_angle: 90,
			image_xscale: 0
		});
		
		tentacles_instance.change_scale(2, 0.1);	
		tentacles_instance.draw_no_in_arena = true;
		i += angle;
	}	
		
	L+= 30;
}
repeat_spwan = 1;

time_source_spwan_tentacles = time_source_create(time_source_game, 0.1, time_source_units_seconds, function () {
	spwan_tentacles();	
}, [], repeat_spwan);

soul_invulnerability = 20;

index_sprite = 0;
index_sprite_finish = sprite_get_number(sprite_index) - 1;
hit = false;

target_place = obj_battle_soul;

direction_fist = !image_angle ?  pusher : -pusher;

destroy = false;

outside_force_speed =  direction_fist + speed_count * dtime;
draw_no_in_arena = false;