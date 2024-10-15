function battle_border_get() {
	var border = obj_battle_border;
	if (instance_exists(border)) return false;
	
	return border;
}
function battle_get_board_surface() {
	if (!instance_exists(obj_battle_border))
		return undefined;
	
	return obj_battle_border._surface;
}
function battle_border_create(up, down, left, right) {
	var border = obj_battle_border;
	if (instance_exists(border)) return obj_battle_border;
	
	var inst_border = instance_create_depth(0, 0, 0, border);
	battle_border_set_size(up, down, left, right);
	battle_border_start_animation("Create");
	
	border.up_start = up;
	border.down_start = down;
	border.left_start = left;
	border.right_start = right;
	
	return inst_border;
}
function battle_border_set_postion(x, y) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	if (!is_bool(x)) border.x = x;
	if (!is_bool(y)) border.y = y;
	return true;
}
function battle_border_add_postion(x, y) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	if (!is_bool(x)) border.x += x;
	if (!is_bool(y)) border.y += y;
	return true;
}
function battle_border_get_position() {
	var border = obj_battle_border;
	if (!instance_exists(border))
		return { px: undefined, py: undefined };
	
	return { px: obj_battle_border.x, py: obj_battle_border.y }
}
function battle_border_reset_postion(x, y) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	if (!is_bool(x)) border.x = battle_border.x;
	if (!is_bool(y)) border.y = battle_border.y;
	return true;
}
function battle_border_set_size(up, down, left, right) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return;
	
	if (!is_bool(up)) border.up = up;
	if (!is_bool(down)) border.down = down;
	if (!is_bool(left)) border.left = left;
	if (!is_bool(right)) border.right = right;
	return true;
}
function battle_border_add_size(up, down, left, right) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	if (!is_bool(up)) border.up += up;
	if (!is_bool(down)) border.down += down;
	if (!is_bool(left)) border.left += left;
	if (!is_bool(right)) border.right += right;
	return true;
}
function battle_border_reset_size() {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	border.up = border.up_start;
	border.down = border.down_start;
	border.left  = border.left_start;
	border.right = border.right_start;
	border.angle = 0;
	return true;
}
function battle_border_set_color(color, color_bg, color_fm) {
	var border = obj_battle_border; 
	if (!instance_exists(border)) return;
	
	if (!is_bool(color))    border.color       = color;
	if (!is_bool(color_bg)) border.color_bg    = color_bg;
	if (!is_bool(color_fm)) border.color_frame = color_fm;
}
function battle_border_reset_color(color, color_bg, color_fm) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	if (!is_bool(color))	   border.color = c_white;
	if (!is_bool(color_bg)) border.color_bg = c_black;
	if (!is_bool(color_fm)) border.color_fm = c_white;
}
function battle_border_set_angle(angle) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	border.angle = angle;
	return true;
}
function battle_border_add_angle(angle) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	border.angle += angle;
	return true;
}
function battle_border_reset_angle() {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	border.angle = 0;
	return true;
}
function battle_border_get_angle() {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	return border.angle;
}
function battle_border_start_animation(anim_id) {
	switch (anim_id) {
		default:
			return false;
			break;
		case "Create":
		case "Start":
		case "DeltaruneS":
		case 0:
			var anim = instance_create_depth(0, 0, 0, obj_battle_border_anim);
			anim.animation_id = "Create";
			break;
		case "Destroy":
		case "End":
		case "DeltaruneE":
		case 1:
			var anim = instance_create_depth(0, 0, 0, obj_battle_border_anim);
			anim.animation_id = "Destroy";
			break;
	}
	return true;
}
function battle_border_start_animation_end() {
	return instance_exists(obj_battle_border_anim);
}
function battle_border_get_size(size_id) {
	var border = obj_battle_border;
	if (!instance_exists(border)) return false;
	
	switch (size_id) {
		case 0:
		case "u":
		case "U":
		case "up":
		case "Up":
			return border.up;
			break;
		
		case 1:
		case "d":
		case "D":
		case "down":
		case "Down":
			return border.down;
			break;
			
		case 2:
		case "l":
		case "L":
		case "left":
		case "Left":
			return border.left;
			break;
		
		case 3:
		case "r":
		case "R":
		case "right":
		case "Right":
			return border.right;
			break;
	}
}