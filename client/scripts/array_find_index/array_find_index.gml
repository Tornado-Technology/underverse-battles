/// @param {Array<Any>} array
/// @param {Function} predicate
/// @param {Array<Any>} args
function array_find_index(array, predicate, args = []) {
	for (var i = 0; i < array_length(array); i++) {
		var value = array[i];
		if (predicate(value, i, args)) {
			return i;
		}
	}
	
	return undefined;
}
