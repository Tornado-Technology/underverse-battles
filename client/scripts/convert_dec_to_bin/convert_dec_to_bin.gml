/// @desc convert_dec_to_bin
/// @arg value
/// @arg [digits]
function convert_dec_to_bin(dec) {
	dec = abs(dec);
	var res = "";

	while (dec != 0) {
	    res = string(dec & 1) + res;
	    dec = dec >> 1;
	}

	if res = "" res = "0";

	if argument_count > 1
	{
	    while (string_length(res) < argument[1])
	    {
	        res = "0" + res;
	    }
	}

	return res;
}
