event_inherited();
disable_surface = true;
speed_max = 0;

step = 0.03;

platform = instance_create_depth(x, y, fight_depth.bullet_outside, obj_platform, {
	has_fixed_movement: false,
	sprite_index: spr_battle_spinning_platform
	
});
platform.disable_surface = true;
platform.can_move = false;
platform.image_xscale = image_yscale + 1.2;
platform.depth = depth + 200;