
/// @param {Array<Function>} scene_actions
function cutscene_create(_scene_actions) {
	return instance_create(obj_cutscene, { 
		creator_insatnce: id,
		scene_actions: _scene_actions 
	});
}
