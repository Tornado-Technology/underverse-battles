var dir_ = image_angle;
var dist_ = image_xscale * 32;

instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_new_wall, {
	image_angle: dir_,
	image_xscale: dist_
});