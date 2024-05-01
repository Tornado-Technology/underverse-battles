motion_set(direction, speed_const * dtime);

var wave_ = obj_wave_from_wings_anastasia;

if (place_meeting(x, y, wave_) && !wave_.disappearance) {
	direction = wave_.image_angle;
	speed_const = wave_.speed_feathers;	
	image_angle = wave_.image_angle;
}
image_angle += dcos(30)

if (!image_alpha) {
	image_alpha += 0.5;	
}