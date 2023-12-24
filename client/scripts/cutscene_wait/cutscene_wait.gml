/// @param {Real} time
function cutscene_wait(_time) {
	time++;
	
	if (time >= _time * fps) {
		time = 0;
		return true;
	}
	
	return false;
}