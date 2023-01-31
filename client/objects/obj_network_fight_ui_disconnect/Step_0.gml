blackout_alpha = approach(blackout_alpha, blackout_alpha_target, 0.01);
time++;

spinner_angle = lerp(spinner_angle, 360, 0.1);
spinner_angle = spinner_angle >= 357 ? 360 : spinner_angle;
spinner_angle = spinner_angle == 360 ? 0 : spinner_angle;