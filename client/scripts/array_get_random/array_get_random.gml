/// @description Returns a random element of the array.
/// @param {Array<Any>} array
/// @return {Any}
function array_get_random(array) {
	var index = irandom_range(0, array_length(array) - 1);
	return array[index];
}
