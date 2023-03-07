/// @description Deletes all elements of the specified array.
/// @param {Array<Any>} array
function array_clear(array) {
	array_delete(array, 0, array_length(array) + 1);
}
