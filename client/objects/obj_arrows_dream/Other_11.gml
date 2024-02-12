/// @description Ricochet
if (size_ricochet == -1) {
	exit;
};

var border_instance = obj_battle_border;

var px1 = border_instance.x - border_instance.left;
var px2 = border_instance.x + border_instance.right;
var py1 = border_instance.y - border_instance.up;
var py2 = border_instance.y + border_instance.down;
var offset  = 17;
var collision =  collision_rectangle(px1 + offset, py1 + offset, px2 - offset, py2 - offset, self, true, false);

if (collision != noone) {
	 touching_walls = true;	
}
if (collision == noone) {
	if (touching_walls) {
		image_angle = point_direction(x, y, target.x, target.y);
		size_ricochet--;
	 };	
	 touching_walls = false;
};
