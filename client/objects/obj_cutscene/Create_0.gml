// Parser
scene_id = 0;
time = 0;

// Jump
object_jump_y = undefined;
object_jumped = false;

// Dialog
dialog_created = false;
instance_dialog = noone;

// Other
instances = [];

if (!variable_instance_exists(id, "creator_insatnce")) {
	creator_insatnce = noone;
}

if (!variable_instance_exists(id, "scene_actions")) {
	scene_actions = [];
}

