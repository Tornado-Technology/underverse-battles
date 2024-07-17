event_inherited();

damage = get_char_damage(obj_character_papyrus);

soul_invulnerability = 20;

image_xscale = -1;

var bone_instance =	instance_create_depth(x, y - 7, fight_depth.bullet_outside_hight, obj_cool_bone_papyrus, {
	skate: id
});
	
bone_instance.speed_const = 1 + speed_const;