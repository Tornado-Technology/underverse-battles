time++;
image_angle = _target_angle; 

motion_set(image_angle, _speed);

if(_use_particle)
	event_user(0);
	
if (time >= time_max)
	instance_destroy();