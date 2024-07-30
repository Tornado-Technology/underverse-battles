
if (image_alpha <= 1) {
	image_alpha += step;	
};
if(image_alpha <= 0.5) exit;

motion_set(direction, speed_const * dtime);

var wave_ = obj_wave_wings_xanastasia;

if (place_meeting(x, y, wave_) && !wave_.disappearance) {
	direction = wave_.image_angle;
	speed_const = wave_.speed_feathers;	
	image_angle = wave_.image_angle;
};

image_angle = direction;
angle += speed_const * dtime;
image_angle += dsin(angle * 6) * 10;

