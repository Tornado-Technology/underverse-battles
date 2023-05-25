/// @description Checks if a specific element exists in the array.
/// @param {Array<Any>} array
/// @param {Any} element
/// @return {Bool}
function array_includes(array, element) {
	return array_indexof(array, element) != -1;
}
