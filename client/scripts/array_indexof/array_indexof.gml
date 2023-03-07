/// @description Searches for the `index` (ordinal number) of an array element.
/// @param {Array<Any>} array
/// @param {Any} element
/// @return {Real}
function array_indexof(array, element) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == element) {
			return i;
		}
	}
	
	return -1;
}
