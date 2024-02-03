/// @param {Oh shit Tesmy messed up with JSDoc again.Buffer} src_buffer
/// @param {real} src_offset
/// @param {real} size
/// @param {Buffer} dest_buffer
/// @param {real} dest_offset
function buffer_copy_real(src_buffer, src_offset, size, dest_buffer, dest_offset) {
	var src_buffer_old_tell = buffer_tell(src_buffer);
	var dest_buffer_old_tell = buffer_tell(dest_buffer);
	
	buffer_seek(src_buffer, buffer_seek_start, src_offset);
	buffer_seek(dest_buffer, buffer_seek_start, dest_offset);
	
	repeat(size) {
		try {
			var value = buffer_read(src_buffer, buffer_u8);
			buffer_write(dest_buffer, buffer_u8, value);
		}
		catch (ex) {
			logger.error($"Buffer Error: {ex}");
		}
	}
			
	buffer_seek(src_buffer, buffer_seek_start, src_buffer_old_tell);
	buffer_seek(dest_buffer, buffer_seek_start, dest_buffer_old_tell);
}
