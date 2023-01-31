/// @param {Real} target
function input_unbind(target) {
	var input_key = input_find(target);
	if (input_key == undefined) return;
	
	input_key.clear_key();
}
