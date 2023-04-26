///@desc Overwrite
if (!is_overwrite) exit;
    
target_position.x = overwrite_position.x;
target_position.y = overwrite_position.y;

if (is_room_border) {
    //target_position.x = clamp(target_position.x - view_width / 2, 0, room_width - view_width);
    //target_position.y = clamp(target_position.y - view_height / 2, 0, room_height - view_height);
}