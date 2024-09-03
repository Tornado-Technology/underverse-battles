on_soul_touch = function () {};

depth = fight_depth.bullet;
image_alpha = 0;
disable_surface = true;
step = 2;

speed_count = 0;
bullet_count = 3;

is_bonb = false;


alpha = 1;
radius = 10;
alpha_time = 0.05;
soul = obj_battle_soul;
angle_spades = 30;
spades_count = 12;

spwan_spades = function () {
	var i = 0;
	repeat(spades_count) {
		 instance_create_depth(x, y, 0, obj_bullet_jevil, {
			sprite_index: spr_jevil_spades,
			speed_count: speed_count,
			angle: angle_spades * i
		});
		
		i++;
	}
}
 
 
spwan_diamonds = function () {
var	target = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
var	angle = point_direction(x, y, target.x, target.y);
			
	var	i = 0;
	repeat(bullet_count) {
			bullet = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_bullet_jevil, {
			sprite_index: spr_jevil_diamonds,
			speed_count: speed_count - 0.1 * i,
			angle: angle
		})
		
		i++;
	}
}


spwan_hearts = function () {
var target = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
var  angle = point_direction(x, y, target.x, target.y);
		
	instance_create_depth(x, y, 0, obj_jevil_hearts_bullet, {	
		angle: angle,
		speed_count: speed_count
	});

}


spwan_clubs = function () {
var bullets = [];
var i;
var angle_offset = 15;
var	target = (instance_exists(soul) ? new Vector2(soul.x, soul.y) : new Vector2(0, 0));
var	angle = point_direction(x, y, target.x, target.y);
			
	i = 0;
	repeat(bullet_count) {
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
	
};




bomb = function () {
	switch(sprite_index) {
		case spr_jevil_diamonds_box:
			spwan_diamonds();
		break;
		
		case spr_jevil_hearts_box: 
			spwan_hearts();
		break;
		
		case spr_jevil_spades_box:
			spwan_spades();
		break;
		
		default:
		case spr_jevil_clubs_box: 
			spwan_clubs();
		break;	
	}
	audio_play_sound_plugging(snd_bomb);
};