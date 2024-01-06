damage = get_char_damage(obj_character_jevil);
depth = fight_depth.bullet_outside;

_angle_hearts = 0;
hearts = [];
rad = 12;
var i = 0;
repeat (4) {
	var heart = instance_create_depth(x, y, 0, obj_jevil_bullet, {
	sprite_index : spr_jevil_hearts_small,
	image_speed : 0,
	image_index : 0,
	_speed : 0
	});
	
	hearts[i] = heart;
	i++;
}