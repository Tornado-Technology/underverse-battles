time_source_start(time_source_spwan);	

var border = obj_battle_border;

motion_set(direction, speed_const * dtime);
if (y < border.y - border.up) {
	direction = 270;
}
if (y > border.y + border.down) {
	direction = 90;	
}