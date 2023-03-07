/// @description Searches for a specific element by predicate.
/// @param {Array<Any>} array
/// @param {Function} predicate
/// @return {Any}
function array_find(array, predicate) {
	return array[array_find_index(array, predicate)];
}
