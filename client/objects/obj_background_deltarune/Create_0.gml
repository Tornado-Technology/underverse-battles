sprite_index = noone;

alpha = 0;

layer_1 = layer_create(99, "Dark bg");
layer_bg_1 = layer_background_create(layer_1, noone);
layer_background_alpha(layer_bg_1, alpha);
layer_background_blend(layer_bg_1, c_black);
		
layer_2 = layer_create(98, "Dark cells");
layer_bg_2 = layer_background_create(layer_2, spr_background_dr_cell);
layer_background_alpha(layer_bg_2, alpha);
bg_color = make_color_rgb(36, 0, 36);
layer_background_blend(layer_bg_2, bg_color);
layer_hspeed(layer_2, -0.2);
layer_vspeed(layer_2, -0.2);
layer_background_htiled(layer_bg_2, true);
layer_background_vtiled(layer_bg_2, true);
		
layer_3 = layer_create(97, "Light cells");
layer_bg_3 = layer_background_create(layer_3, spr_background_dr_cell);
layer_background_alpha(layer_bg_3, alpha);
bg_color = make_color_rgb(66, 0, 66);
layer_background_blend(layer_bg_3, bg_color);
layer_hspeed(layer_3, 0.5);
layer_vspeed(layer_3, 0.5);
layer_background_htiled(layer_bg_3, true);
layer_background_vtiled(layer_bg_3, true);

emergence = true;
disappearance = false;