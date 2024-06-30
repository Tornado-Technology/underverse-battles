event_inherited();

angle_hearts = 0;
hearts = [];
radius = 12;
disable_surface = true;

damage = get_char_damage(obj_character_jevil);

sprite_frame = 0;
var i = 0;

repeat(4) {
	var heart = instance_create_depth(x, y, 0, obj_bullet_jevil, {
		sprite_index: spr_jevil_hearts,
		angle: angle_hearts,
		speed_count: speed_count
	});
	hearts[i] = heart;
	
	i++;
}
