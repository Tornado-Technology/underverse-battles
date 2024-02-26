/// @desc Buffer
var buffer = global.__achievement_list_buffer;

if (array_length(buffer) <= 0) exit;

if (instance_exists(obj_ui_achievements)) exit;
var achievement = achievements[buffer[0]];
array_delete(buffer, 0, 1);
instance_create(obj_ui_achievements, {
	achievement: achievement,
});