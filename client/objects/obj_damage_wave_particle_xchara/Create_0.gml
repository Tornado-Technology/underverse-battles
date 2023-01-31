depth = fight_depth.bullet;

image_alpha = 1;

image_xscale = 0.7;
image_yscale = 0.7;

image_alpha = random_range(0.7, 1);
image_blend = choose(c_white, c_white, c_white, c_ltgrey, c_ltgrey, c_dkgrey);

motion_add(dir.up, 0.2); 