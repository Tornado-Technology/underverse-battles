/// @description Classic C# string.Format command. Up to 15 parameters allowed, use {0}, {1}...
/// Example: string_format("Hello {0}, you have {1} gold", name, balance)
/// @param {String} str - The string to format (+ followed by up to 16 formatargs).
function sprintf(str) {
	var replaced = str;
	
	for (var i = 1; i < argument_count; i++) {
		replaced = string_replace_all(replaced, "{" + string(i - 1) + "}", string(argument[i]));
	}
	
	return replaced;
}
