time++;

if (time == 30) {
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_damage_zone_xchara);
	instance.warning = id;
}

image_alpha = lerp(image_alpha, image_alpha_target, image_alpha_amount);