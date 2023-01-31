/// @param {number} buffer
function buffer_visualize(buffer) {
	var str = "Buffer <";
	var size = buffer_get_size(buffer);
	
	for(var pos = 0; pos < size;) {
		var n = buffer_peek(buffer, pos, buffer_u8);
		str += string_replace(string(ptr(n)), "000000", "") + " ";
		pos += 1;
	}
	
	str += ">";
	return str;
}
