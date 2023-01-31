/// @desc Classic C# string.Format command. Up to 15 parameters allowed, use {0}, {1}...
/// Example: string_format("Hello {0}, you have {1} gold", name, balance)
/// @param {String} str - The string to format (+ followed by up to 16 formatargs).
function sprintf(str) {
	var rv = str;
	for (var i = 1; i < argument_count; i++) {
		rv = string_replace_all(rv, "{" + string(i - 1) + "}", string(argument[i]));
	}
	return rv;
}
