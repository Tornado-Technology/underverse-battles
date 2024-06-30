event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_jevil);

soul_invulnerability = 20;
backwards = false;

sprite_frame = 0;

angle = 0;

target_position_x = 0;
backwards_x = xstart;
alpha = 0;

if (image_index > 0) {
	step += 0.03;	
};

image_xscale = -1;
	
destroy = false;	
	
on_soul_touch = function(soul) {
	if (!backwards) {
		fight_soul_damage(damage, destructible, id);
	};
}