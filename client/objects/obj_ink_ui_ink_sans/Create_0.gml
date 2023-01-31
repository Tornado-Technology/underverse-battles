/* Depth */
depth = -999999999;

/* Randomize */
x = irandom_range(0, room_width);
y = irandom_range(0, room_height);
image_speed  = 0;
image_angle  = irandom_range(0, 360);
image_index  = irandom_range(0, image_number);
image_xscale = choose(0.75, 0.9, 1, 1.25, 1.5);
image_yscale = image_xscale;
image_alpha = 1;