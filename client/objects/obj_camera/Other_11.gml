///@desc Target
if (target == noone || !instance_exists(target) || is_overwrite) exit;

target_position = new Vector2(target.x, target.y)

if (is_room_border) {
	target_position.x = clamp(target_position.x - view_width / 2, 0, room_width - view_width);
	target_position.y = clamp(target_position.y - view_height / 2, 0, room_height - view_height);
}