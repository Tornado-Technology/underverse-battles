depth = fight_depth.bullet_outside_hight;
damage = get_char_damage(char_jevil);
_speed = 0;
_angle = 0;
_angle_hearts = 0;
hearts = [];
rad = 12;

for (var i = 0; i < 4; i++) {
	var heart = instance_create_depth(x, y, 0, obj_jevil_bullet);
	heart.sprite_index = spr_jevil_hearts_small;
	heart.image_speed = 0;
	heart.image_index = 0;
	heart._speed = 0;
	hearts[i] = heart;
}