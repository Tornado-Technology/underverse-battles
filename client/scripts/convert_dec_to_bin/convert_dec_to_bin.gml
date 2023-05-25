/// @param {Real} value - A positive integer, attempts to feed other numbers will cause the project to crash
/// @param {Real} length - The total length of the string. Extra characters will be filled with 0
/// @return {String|undefined}
function convert_dec_to_bin(value, length = undefined) {
	if (value < 0) {
		logger.fatal("Incorrect value `{0}` of argument `value` function `convert_dec_to_bin` takes only positive integers.", value);
	}
	
	var result = "";
	while (value != 0) {
	    result = string(value & 1) + result;
	    value = value >> 1;
	}

	if (result == "") {
		result = "0";
	}
	
	if (length != undefined){
	    while (string_length(result) < length) {
	        result = "0" + string(result);
	    }
	}

	return result;
}
