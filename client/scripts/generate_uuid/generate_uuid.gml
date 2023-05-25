/// @return {String}
function generate_uuid() {
	return convert_dec_to_hex(generate_unique_id() * 1000 * current_time);
}
