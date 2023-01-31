if (image_alpha < 1)
	image_alpha += 0.05;
	
if (is_spining)
	image_angle += speed_angle;
	
if (is_moving) {
	if (step == 0 && speed < speed_max) { // Набирание скорости
		speed += 0.1;
	}
	else if (step == 0) { // Движение
		step = 1;
	}
	else if ((direction == 0 && x > point_stop_x || direction == 180 && x < point_stop_x) && step == 1) { // Остановка
		if (speed > 0)
			speed -= 0.2;
		else {
			step = 2;
		}
	}
	else if ((direction == 270 && y > point_stop_y || direction == 90 && y < point_stop_y) && step == 1) { // Остановка
		if (speed > 0)
			speed -= 0.2;
		else {
			step = 2;
		}
	}
}