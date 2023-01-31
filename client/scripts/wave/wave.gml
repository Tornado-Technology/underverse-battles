/// @param {real} val1
/// @param {real} val2
/// @param {real} duration
/// @param {real} offset
/// @desc Returns a value that will wave back and forth between val1 - val2 over duration seconds
function wave(from, to, duration, offset = 0, time = current_time) {
	var a4 = (to - from) * 0.5;
	return from + a4 + cos((((time * 0.001) + duration * offset) / duration) * (pi * 2)) * a4;
}
