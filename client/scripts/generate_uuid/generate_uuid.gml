function generate_uuid() {
	var unique = generate_unique_id();
	return convert_dec_to_hex(unique * 1000 * current_time);
}
