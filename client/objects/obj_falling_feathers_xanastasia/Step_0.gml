time += dtime
image_angle = (sin(time/25)*15);

if (image_alpha < 1)
	image_alpha += alpha_step * dtime;
	
y+=(_speed+((cos(time/12.5)*0.25)+1))*dtime;
x=primal_x+sin(time/25)*40;